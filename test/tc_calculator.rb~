require 'lib/calculator'
require 'test/calculator_helper'
require 'test/unit'

# Maybe writing tests longer than simple classes
# is not the best way to go, but as I'm learing
# I think it is justified.


class CalculatorTest < Test::Unit::TestCase
  
  def test_initialize_ok
    new_calc = Proc.new do |expression|
      assert_nothing_raised do 
        calc = Calculator.new(expression)
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
    examples = { '' => 0,
                 '1' => 1,
                 '1,2' => 3 }
    method_test(examples, 'add')
  end

  def test_unknown_amount
    examples = { '1,2,3' => 6,
                 '1,2,5,8' => 16 }
    method_test(examples, 'add')
  end

  def test_diff_method
    examples = { '1,0'       => 1,
                 '3,2,1'     => 0,
                 '5,4,3,2,1' => -5,
                 ''          => ArgumentError,
                 '5'         => ArgumentError }
    method_test(examples, 'diff')
  end

  def test_prod_method
    examples = { '0'     => 0,
                 '2,1'   => 2,
                 '3,2,1' => 6 }
    method_test(examples, 'prod')
  end

  def test_div_method
    examples = { '2,1'   => 2,
                 '3,2,1' => 1,
                 '1,2,3' => 0,
                 '2,4,0' => ArgumentError,
                 '0,3,2' => ArgumentError }
    method_test(examples, 'div')
  end
end
