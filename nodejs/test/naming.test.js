const { suggestNames } = require('../src/naming');
const { getTraitProfile } = require('../src/traits');

test('suggestNames returns names with traits', () => {
  const profile = getTraitProfile('playful', 'tech', 'English');
  const names = suggestNames(profile, 'English');
  expect(names.some(n => n.includes('playful') || n.includes('tech'))).toBe(true);
});