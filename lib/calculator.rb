class Calculator
  attr_reader :digits

  def initialize(expression) # expression is a string
    self.expr = expression
  end

  def expr=(expression)
    if /\A\d?(,\d)*\z/ === expression
      @digits = expression.split(',').map {|x| x.to_i}
    else
      raise ArgumentError, 'Expression must be a "digit/digit" string'
    end
  end

  def add
    @digits.inject(0, :+)
  end

  def diff
    raise ArgumentError, 'To use diff expression must have at least 2 digits' if @digits.length < 2
    @digits.inject(:-)
  end

  def prod
    @digits.inject(:*)
  end
end
