from schema_loader import load_schema

model = None
schema_docs = None
schema_embeddings = None


def _get_model():
    global model

    if model is None:
        from sentence_transformers import SentenceTransformer

        model = SentenceTransformer("all-MiniLM-L6-v2")

    return model


def _load_schema_index():
    global schema_docs, schema_embeddings

    if schema_docs is None:
        embedding_model = _get_model()
        schema_docs = load_schema()
        schema_embeddings = embedding_model.encode(schema_docs, normalize_embeddings=True)


def get_schema_context(question):
    _load_schema_index()

    embedding_model = _get_model()
    q_embed = embedding_model.encode(question, normalize_embeddings=True)
    scores = schema_embeddings @ q_embed
    top_indexes = scores.argsort()[-4:][::-1]

    return "\n".join(schema_docs[i] for i in top_indexes)
