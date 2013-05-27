class Block extends MarkbackNode
  convert: ->
    out = super.trim()
    if out.length == 0
      ""
    else
      "\n" + this.prefix() + out + "\n\n"

