function getEmbedding(text, language) {
  const seed = Array.from(text).reduce((acc, c) => acc + c.charCodeAt(0), 0);
  const vec = [];
  for (let i = 0; i < 300; i++) {
    vec.push(((Math.sin(seed + i) + 1) / 2));
  }
  return vec;
}

function cosineSimilarity(vec1, vec2) {
  const dot = vec1.reduce((sum, v, i) => sum + v * vec2[i], 0);
  const norm1 = Math.sqrt(vec1.reduce((sum, v) => sum + v * v, 0));
  const norm2 = Math.sqrt(vec2.reduce((sum, v) => sum + v * v, 0));
  if (norm1 === 0 || norm2 === 0) return 0;
  return dot / (norm1 * norm2);
}

module.exports = { getEmbedding, cosineSimilarity };