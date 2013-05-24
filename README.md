# markback

Sensible conversion from HTML to markdown. Will run in
a browser, in a command line, or as a node module.
It uses the DOM to do its magic: Whatever the browser
sees should be what you get.

## Example:

```html
HTML VERSION                                                    MARKDOWN VERSION

<h1>This is a test</h1>                                         # This is a test

<p><b>Lorem ipsum</b> dolor sit amet, consectetur               **Lorem ipsum** dolor sit amet, consectetur
elit, sed do eiusmod tempor incididunt ut labore et             elit, sed do eiusmod tempor incididunt ut labore et
dolore magna aliqua. Ut enim ad minim veniam, qui               dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip            nostrud exercitation ullamco laboris nisi ut aliquip
ex ea commodo consequat. Duis aute irure dolor in               ex ea commodo consequat. Duis aute irure dolor in
reprehenderit in voluptate velit esse cillum dolore             reprehenderit in voluptate velit esse cillum dolore
eu fugiat nulla pariatur. Excepteur sint occaecat               eu fugiat nulla pariatur. Excepteur sint occaecat
cupidatat non proident, sunt in culpa qui officia               cupidatat non proident, sunt in culpa qui officia
deserunt mollit anim id est laborum</p>                         deserunt mollit anim id est laborum
```

## FAQ:

**Q: Will it leave HTML it doesn't understnad untouched?**

**A:** It will try. No guarantees, though.

**Q: Is it compatible with GitHub Flavored Markdown?**

**A:** Not quite yet. The HTML for GitHub's flavor seems really
complex. Maybe it would be a good v2.0 feature.

## Licence

MIT.
