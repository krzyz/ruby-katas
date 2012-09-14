class Calculator
  attr_accessor :expr

  def initialize(expression) # expression is a string
    if /\A\d,\d\z/ === expression
      @expr = expression 
    else
      raise ArgumentError, 'Argument must be a "digit,digit" string'
    end
  end
end
