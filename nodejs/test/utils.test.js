const { cleanText, slugify } = require('../src/utils');

test('cleanText removes punctuation', () => {
  expect(cleanText('Hello, World!')).toBe('hello world');
});

test('slugify replaces spaces', () => {
  expect(slugify('Hello World', 'English')).toBe('hello-world');
});