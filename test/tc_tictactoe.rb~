require 'lib/tictactoe'
require 'test/unit'

class TicTacToeTest < Test::Unit::TestCase
  def setup
    @board = Board.new
  end

  def test_move
    @board.move(1, 1, 'x')
    assert_equal 'x', @board.piece_at(1, 1)
  end
  
  def test_invalid_move
    assert_raise ArgumentError do
      @board.move(4, 4, 'x')
      @board.move(1, 1, 'z')
    end

    @board.move(1, 1, 'x')
    assert_raise RuntimeError do
      @board.move(1, 1, 'o')
    end
  end
end
