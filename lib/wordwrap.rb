class WordWrap
  def initialize(wrap)
    raise ArgumentError unless wrap.instance_of?(Fixnum)
    @wrap_column = wrap
  end

  def wrap(string)
    raise ArgumentError unless string.instance_of?(String)
    @string = string
  end
end
