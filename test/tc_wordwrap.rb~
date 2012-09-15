require 'lib/wordwrap'
require 'test/unit'

class WordWrapTest < Test::Unit::TestCase

  def test_initialize_ok
    assert_nothing_raised do
      WordWrap.new 4
    end
  end

  def test_initialize_non_integer
    assert_raise ArgumentError do
      WordWrap.new
    end
    assert_raise ArgumentError do 
      WordWrap.new "foo" 
    end
  end

end
