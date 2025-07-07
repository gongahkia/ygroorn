const { getTraitProfile } = require('./traits');
const { suggestNames } = require('./naming');
const { getEmbedding, cosineSimilarity } = require('./embeddings');
const { cleanText } = require('./utils');

function generateRepoNames(description, vibe, theme, language, n = 5) {
  const profile = getTraitProfile(vibe, theme, language);
  const descVec = getEmbedding(cleanText(description), language);
  const candidates = suggestNames(profile, language);
  const scored = candidates.map((name) => {
    const nameVec = getEmbedding(name, language);
    return { name, score: cosineSimilarity(descVec, nameVec) };
  });
  scored.sort((a, b) => b.score - a.score);
  return scored.slice(0, n).map((item) => item.name);
}

module.exports = { generateRepoNames };