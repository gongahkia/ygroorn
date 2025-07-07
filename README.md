[![](https://img.shields.io/badge/ygroorn_1.0.0-passing-green)](https://github.com/gongahkia/ygroorn/releases/tag/1.0.0)

# `You’re Gonna Run Out Of Repo Names`

A [CLI tool]() for brainstorming Github Repository names.

Henceforth abbreviated to `ygroorn`.

## Stack

* *Script*: [Python](https://www.python.org/), [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript), [Ruby](https://www.ruby-lang.org/en/), [Go](https://go.dev/)
* *Package*: [Docker]()

## Screenshot

...

## Architecture

...

## Usage

The below instructions are for running a packaged version of `ygroorn` locally.

To call `ygroorn` as a [Module](#python-module-instructions), [Library](#npm-library-instructions), [Gem](#ruby-gem-instructions) or [Package](#go-package-instructions), see the respective instructions [here](#coverage).

1. Execute the below.

```console
$ git clone https://github.com/gongahkia/ygroorn && cd ygroorn
```

2. To build and run the `ygroorn` Docker Image in interactive mode, run the below.

```console
$ docker build -t ygroorn-all .
$ docker run -it --rm ygroorn-all
```

## Coverage

`ygroorn` is currently served via the following sources.

* [Python Module](https://docs.python.org/3/tutorial/modules.html)
* [NPM Library](https://www.npmjs.com/)
* [Ruby Gem](https://rubygems.org/)
* [Go Package](https://pkg.go.dev/)

### Python Module Instructions

1. Install the [Python module](./python/).

```console
$ cd python
$ pip install .
```

2. Then run the `ygroorn` CLI.

```console
$ ygroorn generate "Some silly AI project" --vibe playful --theme tech --language English
```

3. Or call `ygroorn` directly within your project.

```py
import ygroorn
names = ygroorn.generate_repo_names("Some silly AI project", "playful", "tech", "English", 5)
print(names)
```

### NPM Library Instructions

1. Install the [Node.js package](./nodejs/).

```console
$ cd nodejs
$ npm install -g .
```

2. Then run the `ygroorn` CLI.

```console
$ ygroorn generate "Some silly AI project" --vibe playful --theme tech --language English
```

3. Or call `ygroorn` directly within your project.

```py
const { generateRepoNames } = require('ygroorn');
const names = generateRepoNames('Some silly AI project', 'playful', 'tech', 'English', 5);
console.log(names);
```

### Ruby Gem Instructions

1. Install the [Ruby Gem](./ruby/).

```console
$ cd ruby
$ gem build ygroorn.gemspec
$ gem install ./ygroorn-0.1.0.gem 
```

2. Then run the `ygroorn` CLI.

```console
$ ygroorn generate "Some silly AI project" --vibe playful --theme tech --language English
```

3. Or call `ygroorn` directly within your project.

```rb
require 'ygroorn'
names = Ygroorn.generate_repo_names('Some silly AI project', 'playful', 'tech', 'English', 5)
puts names
```

### Go Package Instructions

```console
$ 
```

## Reference

My thanks to [Zane Chee](https://github.com/injaneity). The inspiration for this project sprouted from the below conversation with him.

![](./asset/reference/zane.png)