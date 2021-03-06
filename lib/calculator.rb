class Calculator
  attr_reader :digits

  def initialize(expression) # expression is a string
    self.expr = expression
  end

  def expr=(string)
    # because string can be frozen
    expression = string.dup
    delimiters = ''
    while /\A\/\/(\[(?<delimiter>.)\])+\n/ =~ expression do
      delimiters += delimiter
      if /[\*\(\)\[\]\$\{\}\.\/\?\+]/ === delimiter
        delimiter.prepend("\\")
      end
      expression.sub!(/\[#{delimiter}\]/, '')
    end
    expression.sub!("//\n", '')
    if /\A-?\d?([\n,#{delimiters}]-?\d)*\z/ =~ expression
      @digits = expression.split(/[\n,#{delimiters}]/).map {|x| x.to_i}
    else
      raise ArgumentError, 'Expression must be made of digits seperated by commas or newlines'
    end
    negative = @digits.collect { |x| x if x < 0 }.compact
    unless negative.empty?
      raise ArgumentError, "negatives not allowed: #{negative}"
      puts negative
    end
  end

  def add
    @digits.inject(0, :+)
  end

  def diff 
    if @digits.length < 2
      raise ArgumentError, 'To use diff expression must have at least 2 digits'
    end
    @digits.inject(:-)
  end

  def prod
    @digits.inject(:*)
  end

  def div
    if @digits.include? 0
      raise ArgumentError, '0 encountered in expression'
    end
    @digits.inject(:/)
  end
end
