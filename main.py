from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse
from pydantic import BaseModel
import re

from rag import get_schema_context
from llm import generate_sql, generate_summary, generate_insights
from database import get_table_contents, list_tables, run_query

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],   # allow frontend
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def serve_frontend():
    return FileResponse("frontend/index.html")


@app.get("/health")
def health_check():
    return {"status": "ok"}

# ======================================================
# 🧠 GLOBAL CHAT MEMORY (CONTEXT CONTINUITY)
# ======================================================
chat_memory = []   # stores previous Q&A


class Question(BaseModel):
    question: str


def is_database_question(question: str):
    cleaned_question = question.lower().strip()
    words = set(re.findall(r"[a-z0-9_]+", cleaned_question))

    if len(cleaned_question) < 4:
        return False

    database_terms = {
        "category", "categories", "customer", "customers", "employee", "employees",
        "order", "orders", "item", "items", "payment", "payments", "product",
        "products", "review", "reviews", "shipment", "shipments", "supplier",
        "suppliers", "price", "prices", "sales", "revenue", "status", "table",
        "tables", "database", "data", "record", "records", "count", "total",
        "average", "top", "list", "show", "chart", "graph", "plot", "visual"
    }

    try:
        for table in list_tables():
            database_terms.add(table.lower())
            database_terms.update(table.lower().split("_"))
    except Exception:
        pass

    return bool(words & database_terms)


@app.get("/tables")
def get_tables():
    return {"tables": list_tables()}


@app.get("/tables/{table_name}")
def get_table_data(table_name: str):
    columns, rows = get_table_contents(table_name)

    return {
        "table": table_name,
        "columns": columns,
        "rows": [list(r) for r in rows]
    }


@app.post("/ask")
def ask_ai(data: Question):

    question = data.question

    if not is_database_question(question):
        return {
            "error": "Please ask a question related to the database, such as customers, orders, products, payments, shipments, or charts."
        }

    # ======================================================
    # 🧠 BUILD CONVERSATION HISTORY (LAST 4 TURNS ONLY)
    # ======================================================
    history_text = ""
    for item in chat_memory[-2:]:
        history_text += f"User: {item['q']}\nAssistant: {item['a']}\n"

    # ======================================================
    # 🔎 RAG SCHEMA CONTEXT
    # ======================================================
    schema_context = get_schema_context(question)

    # ======================================================
    # 🧠 NEW PROMPT WITH CONTEXT MEMORY
    # ======================================================
    full_prompt = f"""
You are an AI SQL assistant.

Previous Conversation:
{history_text}

Database Schema:
{schema_context}

User Question:
{question}

Rules:
- Understand conversational context.
- If user refers like "he", "that customer", use previous answer.
- Generate ONLY MySQL SELECT query.
- Never generate INSERT, UPDATE, DELETE, DROP.
Return only SQL.
"""

    # ======================================================
    # 🔹 FIRST SQL GENERATION
    # ======================================================
    sql_query = generate_sql(full_prompt, schema_context)

    if not sql_query.lower().startswith("select"):
        return {"error": "Only SELECT allowed"}

    try:
        columns, rows = run_query(sql_query)

        summary = generate_summary(question, columns, rows)
        insights = generate_insights(columns, rows)

    except Exception as e:
        print("SQL FAILED:", e)

        # ======================================================
        # 🔥 AUTO REPAIR STEP (UNCHANGED)
        # ======================================================
        repair_prompt = f"""
The following SQL caused an error.

Previous Conversation:
{history_text}

Question:
{question}

Schema:
{schema_context}

Broken SQL:
{sql_query}

Error:
{str(e)}

Generate a FIXED MySQL SELECT query.
Return only SQL.
"""

        fixed_sql = generate_sql(repair_prompt, schema_context)

        print("FIXED SQL:", fixed_sql)

        columns, rows = run_query(fixed_sql)

        sql_query = fixed_sql

    # ======================================================
    # 🧠 SAVE CONTEXT MEMORY (ONLY SMALL SUMMARY)
    # ======================================================
    try:
        preview_answer = ", ".join([str(r[0]) for r in rows[:2]])
    except:
        preview_answer = "result"

    chat_memory.append({
        "q": question,
        "a": preview_answer
    })

    return {
        "summary": summary,
        "insights": insights,
        "columns": columns,
        "rows": [list(r) for r in rows]
    }
