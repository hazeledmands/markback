EMPHASIS_MARK = '*'

class Emphasis extends Inline
  convert: -> "#{EMPHASIS_MARK}#{super}#{EMPHASIS_MARK}"

