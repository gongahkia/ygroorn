function cleanText(text) {
  return text
    .normalize('NFKD')
    .replace(/[^\w\s-]/g, '')
    .trim()
    .toLowerCase();
}

function slugify(text, language) {
  return cleanText(text).replace(/\s+/g, '-');
}

module.exports = { cleanText, slugify };