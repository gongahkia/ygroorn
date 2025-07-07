import numpy as np

EMBEDDINGS = {}

def load_embeddings(path):
    global EMBEDDINGS
    EMBEDDINGS = {}
    with open(path, 'r', encoding='utf-8') as f:
        for line in f:
            tokens = line.rstrip().split(' ')
            word = tokens[0]
            vector = np.array(list(map(float, tokens[1:])))
            EMBEDDINGS[word] = vector

def get_embedding(text, language=None):
    words = text.lower().split()
    vectors = [EMBEDDINGS[w] for w in words if w in EMBEDDINGS]
    if not vectors:
        return np.zeros(next(iter(EMBEDDINGS.values())).shape)
    return np.mean(vectors, axis=0)

def cosine_similarity(vec1, vec2):
    norm1 = np.linalg.norm(vec1)
    norm2 = np.linalg.norm(vec2)
    if norm1 == 0 or norm2 == 0:
        return 0.0
    return float(np.dot(vec1, vec2) / (norm1 * norm2))