def expr_test(code)
  0.upto(9) do |i|
    0.upto(9) do |j|
      expression = i.to_s + ',' + j.to_s
      code.call(expression)
    end
  end
end

def method_test examples, method
  examples.each do |expr, result|
    if result.instance_of?(Fixnum)
      calc = Calculator.new(expr)
      assert_equal result, eval("calc.#{method}")
    elsif result == ArgumentError
      assert_raise ArgumentError do
        calc = Calculator.new(expr)
        eval("calc.#{method}")
      end
    end 
  end
end

