require 'lib/calculator'
require 'test/calculator_helper'
require 'test/unit'

class CalculatorAdvancedTest < Test::Unit::TestCase
  # Handling new lines instead of commas
  
  def test_newlines
    examples = { "1\n2\n3" => 6,
                 "2,3\n4" => 9,
                 "1,\n2" => ArgumentError,
                 "1\n,2" => ArgumentError }
    method_test(examples, 'add')
  end

  # Exception when passed negative numbers

  def test_negatives
    assert_raise ArgumentError do
      calc = Calculator.new("-1,4\n-5")
    end
  end

  def test_delimiter
    examples = { "//[;]\n1;2" => 3,
                 "1;2" => ArgumentError }
    method_test(examples, 'add')
  end

  def test_delimiter_diff
    examples = { "\\[;]\n2;1" => 1 }
    method_test(examples, 'diff')
  end
end
