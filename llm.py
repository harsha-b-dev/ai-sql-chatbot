from groq import Groq
from schema_guard import get_schema_rules
import os
from dotenv import load_dotenv
load_dotenv()

client = Groq(api_key=os.getenv("GROQ_API_KEY"))

def generate_sql(question, schema_context):

    # 🔥 auto schema rules
    schema_rules = get_schema_rules()

    prompt = f"""
You are a STRICT MySQL SQL generator.

Rules:
- Only generate SELECT queries
- Do not modify database
- Limit results to 50 rows unless user asks otherwise

VERY IMPORTANT RULES:
- Use ONLY columns listed below.
- NEVER invent columns.
- NEVER give explanation.
- Output ONLY ONE SELECT query.

DATABASE COLUMN RULES:
{schema_rules}

SCHEMA CONTEXT:
{schema_context}

USER QUESTION:
{question}
"""

    chat = client.chat.completions.create(
        messages=[{"role":"user","content":prompt}],
        model="llama-3.1-8b-instant",
        temperature=0
    )

    sql = chat.choices[0].message.content.strip()

    sql = sql.replace("```sql","").replace("```","").strip()

    idx = sql.lower().find("select")
    if idx != -1:
        sql = sql[idx:]

    if ";" in sql:
        sql = sql.split(";")[0] + ";"

    print("FINAL SQL:", sql)

    return sql

def generate_summary(question, columns, rows):

    preview = rows[:10]

    prompt = f"""
You are an AI data analyst.

User Question:
{question}

Query Result Columns:
{columns}

Query Result Rows:
{preview}

Write a short clear summary explaining the result to a non-technical user.
Do NOT mention SQL.
Be concise.
"""

    chat = client.chat.completions.create(
        messages=[{"role":"user","content":prompt}],
        model="llama-3.1-8b-instant",
        temperature=0.3
    )

    return chat.choices[0].message.content.strip()


def generate_insights(columns, rows):
    if not rows:
        return "No rows were returned."

    preview = rows[:10]

    prompt = f"""
You are an AI data analyst.

Query Result Columns:
{columns}

Query Result Rows:
{preview}

Write 2-3 concise business insights from these results.
Do NOT mention SQL.
"""

    chat = client.chat.completions.create(
        messages=[{"role":"user","content":prompt}],
        model="llama-3.1-8b-instant",
        temperature=0.3
    )

    return chat.choices[0].message.content.strip()
