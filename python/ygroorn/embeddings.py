import numpy as np

def get_embedding(text, language):
    np.random.seed(hash(text) % 2**32)
    return np.random.rand(300)

def most_similar(vec1, vec2):
    norm1 = np.linalg.norm(vec1)
    norm2 = np.linalg.norm(vec2)
    if norm1 == 0 or norm2 == 0:
        return 0.0
    return float(np.dot(vec1, vec2) / (norm1 * norm2))