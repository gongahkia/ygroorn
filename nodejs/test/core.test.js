const { generateRepoNames } = require('../src/core');

test('generateRepoNames returns expected number of names', () => {
  const names = generateRepoNames('A fun AI project', 'playful', 'tech', 'English', 3);
  expect(names.length).toBe(3);
  names.forEach((name) => expect(typeof name).toBe('string'));
});