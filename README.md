# markback

Sensible conversion from HTML to markdown. Will run in
a browser, in a command line, or as a node module.
It uses the DOM to do its magic: Whatever the browser
sees should be what you get.

## Examples:

<table>
<tr>
<td>
```html
<h1>This is a test</h1>
```
</td>
<td>
```markdown
# This is a test
```
</td>
</tr>
</table>

## FAQ:

**Q: Will it leave HTML it doesn't understnad untouched?""

""A:"" It will try. No guarantees, though.

**Q: Are you compatible with GitHub Flavored Markdown?**

**A:** Not quite yet. The HTML for that shit seems really
complex. Maybe it would be a good v2.0 feature.
