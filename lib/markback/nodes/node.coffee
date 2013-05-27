class MarkbackNode
  convert: ->
    if @domNode.hasChildNodes()
      convertedChildren = for child in @domNode.childNodes
        fromDomNode(child, this).convert()
      convertedChildren.join('')
    else ""
  prefix: -> @parent?.prefix() or ""

