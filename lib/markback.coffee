EMPHASIS_MARK = '*'

fromDomNode = (domNode, parent) ->
  nodeName = domNode.nodeName?.toLowerCase()
  markbackNode = switch
    when domNode.nodeType is window.Node.TEXT_NODE then new Text()
    when nodeName is 'head' then new Head()
    when nodeName is 'div' then new Block()
    when nodeName is 'p' then new Block()
    when nodeName is 'blockquote' then new BlockQuote()
    when nodeName.match(/^h\d$/) then new Heading()
    when nodeName is 'a' then new Anchor()
    when nodeName is 'em' then new Emphasis()
    else new MarkbackNode()
  markbackNode.domNode = domNode
  markbackNode.parent = parent
  markbackNode

class MarkbackNode
  convert: ->
    if @domNode.hasChildNodes()
      convertedChildren = for child in @domNode.childNodes
        fromDomNode(child, this).convert()
      convertedChildren.join('')
    else ""
  prefix: -> @parent?.prefix() or ""

class Head extends MarkbackNode
  convert: -> ''

class Block extends MarkbackNode
  convert: ->
    out = super.trim()
    if out.length == 0
      ""
    else
      "\n" + this.prefix() + out + "\n\n"

class BlockQuote extends Block
  prefix: -> super + "    "

class Heading extends Block
  prefix: -> super + "# "

class Inline extends MarkbackNode
  convert: -> super

class Text extends Inline
  convert: -> @domNode.textContent.replace(/\s+/g, ' ')

class Anchor extends Inline
  convert: -> "[#{super}](#{@domNode.attributes.href.value})"

class Emphasis extends Inline
  convert: -> "#{EMPHASIS_MARK}#{super}#{EMPHASIS_MARK}"

window.Markback = -> fromDomNode(document.documentElement).convert()
