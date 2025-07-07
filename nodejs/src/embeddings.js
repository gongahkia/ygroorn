const fs = require('fs');

let EMBEDDINGS = new Map();

function loadEmbeddings(path) {
  EMBEDDINGS = new Map();
  const lines = fs.readFileSync(path, 'utf-8').split('\n');
  for (const line of lines) {
    const tokens = line.trim().split(' ');
    if (tokens.length < 2) continue;
    const word = tokens[0];
    const vector = Float32Array.from(tokens.slice(1).map(Number));
    EMBEDDINGS.set(word, vector);
  }
}

function getEmbedding(text, language) {
  const words = text.toLowerCase().split(/\s+/);
  const vectors = words
    .map(w => EMBEDDINGS.get(w))
    .filter(Boolean);
  if (vectors.length === 0) {
    // Return a zero vector of the correct size
    return new Float32Array(EMBEDDINGS.values().next().value.length);
  }
  const sum = new Float32Array(vectors[0].length);
  for (const vec of vectors) {
    for (let i = 0; i < vec.length; i++) {
      sum[i] += vec[i];
    }
  }
  for (let i = 0; i < sum.length; i++) {
    sum[i] /= vectors.length;
  }
  return sum;
}

function cosineSimilarity(vec1, vec2) {
  let dot = 0, norm1 = 0, norm2 = 0;
  for (let i = 0; i < vec1.length; i++) {
    dot += vec1[i] * vec2[i];
    norm1 += vec1[i] * vec1[i];
    norm2 += vec2[i] * vec2[i];
  }
  if (norm1 === 0 || norm2 === 0) return 0;
  return dot / (Math.sqrt(norm1) * Math.sqrt(norm2));
}

module.exports = { loadEmbeddings, getEmbedding, cosineSimilarity };