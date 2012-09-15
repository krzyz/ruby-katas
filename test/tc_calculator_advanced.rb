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
end