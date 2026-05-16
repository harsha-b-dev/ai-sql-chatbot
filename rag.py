from sentence_transformers import SentenceTransformer
from schema_loader import load_schema

# Load embedding model
model = SentenceTransformer("all-MiniLM-L6-v2")

schema_docs = None
schema_embeddings = None


def _load_schema_index():
    global schema_docs, schema_embeddings

    if schema_docs is None:
        schema_docs = load_schema()
        schema_embeddings = model.encode(schema_docs, normalize_embeddings=True)


def get_schema_context(question):
    _load_schema_index()

    q_embed = model.encode(question, normalize_embeddings=True)
    scores = schema_embeddings @ q_embed
    top_indexes = scores.argsort()[-4:][::-1]

    return "\n".join(schema_docs[i] for i in top_indexes)
