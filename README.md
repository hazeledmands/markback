# markback

Sensible conversion from HTML to markdown. Will run in
a browser, in a command line, or as a node module.
It uses the DOM to do its magic: Whatever the browser
sees should be what you get.

Still a work in progress -- some of the information in
this document might not yet be true.

## How to run:

### In a browser:

```html
<!doctype html>
<html>
  <head>
    <title>Convert to markdown!</title>
    <script src="https://raw.github.com/demands/markback/master/build/markback.min.js" type="text/javascript"></script>
  </head>
  <body>
    <div id="convertMe">
      <!-- html to convert goes here -->
    </div>
    <pre id="markdown">
      <script type="text/javascript">
        var markdown = Markback(document.getElementById("convertMe"));
        document.write(markdown);
      </script>
    </pre>
  </body>
</html>
```

### From the command line:

```bash
$ npm install -g markback
$ markback < input.html > output.md
```

### As a node module:

```javascript
var Markback = require('markback')
Markback.convertHtml(/* html to convert goes here */, function(markdown) {
  console.log(markdown);
});
```

## Example output:

```html
INPUT                                                           OUTPUT

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

**Q: Will it leave HTML it doesn't understand untouched?**

**A:** It will try. No guarantees, though.

**Q: Is it compatible with GitHub Flavored Markdown?**

**A:** Not quite yet. The HTML for GitHub's flavor seems really
complex. Maybe it would be a good v2.0 feature.

## Specs:

Currently a work in progress.

## License:

MIT.
