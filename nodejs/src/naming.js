const { slugify } = require('./utils');

const NAME_PATTERNS = [
  '{vibe}{theme}',
  '{theme}{vibe}',
  '{vibe}-{theme}',
  '{theme}-{vibe}',
  '{vibe}{theme}hub',
  '{theme}{vibe}lab',
];

function suggestNames(profile, language) {
  return NAME_PATTERNS.map((pattern) => {
    let name = pattern
      .replace('{vibe}', capitalize(profile.vibe))
      .replace('{theme}', capitalize(profile.theme));
    return slugify(name, language);
  });
}

function capitalize(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

module.exports = { suggestNames };