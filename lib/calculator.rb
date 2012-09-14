class Calculator
  attr_reader :expr

  def initialize(expression) # expression is a string
    self.expr = expression
  end

  def expr=(expression)
    if /\A\d,\d\z/ === expression
      @expr = expression 
    else
      raise ArgumentError, 'Expression must be a "digit/digit" string'
    end
  end
end