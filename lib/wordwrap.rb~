class WordWrap
  def initialize(wrap)
    raise ArgumentError unless wrap.instance_of?(Fixnum)
    @wrap_column = wrap
  end

  def wrap(string)
    raise ArgumentError unless string.instance_of?(String)
    string.lstrip!
    if string.length <= @wrap_column
      return string
    elsif wrap_space = string[0...@wrap_column].rindex(" ")
      return string[0...wrap_space] + "\n" + self.wrap(string[wrap_space+1..-1])
    else
      return string[0...@wrap_column] + "\n" + self.wrap(string[@wrap_column..-1])
    end
  end
end
