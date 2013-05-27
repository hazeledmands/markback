fromDomNode = (domNode, parent) ->
  nodeName = domNode.nodeName?.toLowerCase()
  markbackNode = switch
    when domNode.nodeType is window.Node.TEXT_NODE then new Text()
    when nodeName is 'head' then new Head()
    when nodeName is 'div' then new Block()
    when nodeName is 'p' then new Block()
    when nodeName is 'hr' then new Hr()
    when nodeName is 'blockquote' then new BlockQuote()
    when nodeName.match(/^h\d$/) then new Heading()
    when nodeName is 'a' then new Anchor()
    when nodeName is 'em' then new Emphasis()
    when nodeName is 'i' then new Emphasis()
    when nodeName is 'br' then new Br()
    else new MarkbackNode()
  markbackNode.domNode = domNode
  markbackNode.parent = parent
  markbackNode

window.Markback = (domNode = document.documentElement) -> fromDomNode(domNode).convert()
