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

  def test_wrap
    assert_nothing_raised do
      WordWrap.new(5).wrap "this is text"
    end

    assert_raise ArgumentError do
      WordWrap.new(4).wrap([1,2,3])
    end
  end

  def test_empty_wrap
    assert_equal "", WordWrap.new(4).wrap("")
  end

  def test_short_wrap
    assert_equal "word", WordWrap.new(6).wrap("word")
  end

  def test_long_wrap
    assert_equal "word\nword", WordWrap.new(5).wrap("word word") 
    assert_equal "word\nword\nword", WordWrap.new(5).wrap("word word word")
    assert_equal "word word\nword", WordWrap.new(10).wrap("word word word")
  end

  def test_long_words_wrap
    assert_equal "word\nword", WordWrap.new(4).wrap("wordword")
  end

  def test_long_and_space
    assert_equal "wor\nd\nwor\nd\nwor\nd", WordWrap.new(3).wrap("word word word")
  end
end
