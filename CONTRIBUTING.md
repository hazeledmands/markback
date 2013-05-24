# Contributing to markback

Pull requests are encouraged! Please make sure the tests 
pass, and if you're adding a new feature then augment the
tests and recompile the browser javascripts.

## Environment

Make sure dev dependencies are installed with:

```bash
$ npm install --dev
```

## Running the tests

```bash
$ grunt test
```

## Recompiling the browser javascripts

```bash
$ grunt coffee uglify
```
