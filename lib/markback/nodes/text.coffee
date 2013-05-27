class Text extends Inline
  convert: -> @domNode.textContent.replace(/\s+/g, ' ')
