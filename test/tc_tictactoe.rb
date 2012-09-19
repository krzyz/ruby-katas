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
end
