class WordWrap
  def initialize(wrap)
    raise ArgumentError unless wrap.instance_of?(Fixnum)
    @wrap_column = wrap
  end

  def wrap(string)
    raise ArgumentError unless string.instance_of?(String)
    if string.length < @wrap_column
      return string
    else
      wrap_space = string[0...@wrap_column].rindex(" ")
      return string[0...wrap_space] + "\n" + self.wrap(string[wrap_space+1..-1])
    end
  end
end
