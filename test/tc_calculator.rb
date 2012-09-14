require 'lib/calculator'
require 'test/unit'

# Maybe writing tests longer than simple classes
# is not the best way to go, but as I'm learing
# I think it is justified.

def expr_test(code)
  0.upto(9) do |i|
    0.upto(9) do |j|
      expression = i.to_s + ',' + j.to_s
      code.call expression
    end
  end
end

class CalculatorTest < Test::Unit::TestCase
  def test_initialize_ok
    new_calc = Proc.new do |expression|
      assert_nothing_raised do 
        calc = Calculator.new(expression)
        assert_equal(expression, calc.expr)
      end
    end

    expr_test new_calc
  end

  def test_initialize_not_ok
    ["-1,4", "432,4", "43,-1"].each do |expr|
      assert_raise ArgumentError do
        Calculator.new(expr)
      end
    end
  end

  def test_assign_new_expr
    calc = Calculator.new('0,0')
    new_expr = Proc.new do |expression|
      assert_nothing_raised do
        calc.expr = expression
      end
    end

    expr_test new_expr
  end

  def test_add_method
   calc = Calculator.new('')
   assert_equal 0, calc.add
   calc.expr = '1'
   assert_equal 1, calc.add
   calc.expr = '1,2'
   assert_equal 3, calc.add
  end

  def test_unknown_amount
    calc = Calculator.new('1,2,3')
    assert_equal 6, calc.add
    calc.expr = '1,2,5,8'
    assert_equal 16, calc.add
  end
end
