class Anchor extends Inline
  convert: -> "[#{super}](#{@domNode.attributes.href.value})"

