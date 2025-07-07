const VIBES = ['playful', 'serious', 'minimal', 'futuristic', 'bold'];
const THEMES = ['tech', 'art', 'science', 'business', 'education'];
const LANGUAGES = ['English', 'Spanish', 'French', 'German', 'Japanese'];

function getTraitProfile(vibe, theme, language) {
  return {
    vibe: VIBES.includes(vibe) ? vibe : VIBES[0],
    theme: THEMES.includes(theme) ? theme : THEMES[0],
    language: LANGUAGES.includes(language) ? language : LANGUAGES[0],
  };
}

module.exports = { VIBES, THEMES, LANGUAGES, getTraitProfile };