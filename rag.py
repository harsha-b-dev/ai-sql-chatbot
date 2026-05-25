import re

from schema_loader import load_schema

schema_docs = None


def _load_schema_docs():
    global schema_docs

    if schema_docs is None:
        schema_docs = load_schema()

    return schema_docs


def _tokens(text):
    return set(re.findall(r"[a-z0-9_]+", text.lower()))


def get_schema_context(question):
    docs = _load_schema_docs()
    question_tokens = _tokens(question)

    scored_docs = []
    for doc in docs:
        doc_tokens = _tokens(doc)
        score = len(question_tokens & doc_tokens)
        scored_docs.append((score, doc))

    top_docs = [doc for score, doc in sorted(scored_docs, reverse=True) if score > 0]

    if not top_docs:
        top_docs = docs

    return "\n".join(top_docs[:6])
