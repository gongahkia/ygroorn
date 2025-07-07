#!/usr/bin/env node
const yargs = require('yargs');
const { generateRepoNames } = require('./core');
const { VIBES, THEMES, LANGUAGES } = require('./traits');

yargs
  .scriptName('ygroorn')
  .usage('$0 generate [options]')
  .command(
    'generate <description>',
    'Generate creative GitHub repo names',
    (yargs) => {
      yargs
        .positional('description', {
          describe: 'Describe your project',
          type: 'string',
        })
        .option('vibe', {
          alias: 'v',
          describe: `Vibe (${VIBES.join(', ')})`,
          default: 'playful',
        })
        .option('theme', {
          alias: 't',
          describe: `Theme (${THEMES.join(', ')})`,
          default: 'tech',
        })
        .option('language', {
          alias: 'l',
          describe: `Language (${LANGUAGES.join(', ')})`,
          default: 'English',
        })
        .option('n', {
          alias: 'n',
          describe: 'Number of suggestions',
          default: 5,
          type: 'number',
        });
    },
    (argv) => {
      const names = generateRepoNames(
        argv.description,
        argv.vibe,
        argv.theme,
        argv.language,
        argv.n
      );
      names.forEach((name, idx) => {
        console.log(`${idx + 1}. ${name}`);
      });
    }
  )
  .help()
  .argv;