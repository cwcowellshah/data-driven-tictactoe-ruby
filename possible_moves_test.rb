require 'test/unit'
require_relative 'possible_moves'
require_relative 'board'

class PossibleMovesTest < Test::Unit::TestCase

  def setup
    @moves = PossibleMoves.new
  end

  def test_add_to_new_board
    board = Board.new
    board.set_square(:NW, :X)
    @moves.add(board, :win)
    assert_equal(board, @moves.best_move)
  end

  def test_add_to_existing_board
    board = Board.new
    board.set_square(:NW, :X)
    @moves.add(board, :win)
    @moves.add(board, :lose)
    @moves.add(board, :draw)
  end

  def test_best_board
    board_1 = Board.new
    board_1.set_square(:NW, :X)
    @moves.add(board_1, :win)
    @moves.add(board_1, :lose)
    @moves.add(board_1, :draw)

    board_2 = Board.new
    board_2.set_square(:N, :X)
    @moves.add(board_2, :win)
    @moves.add(board_2, :win)
    @moves.add(board_2, :draw)

    board_3 = Board.new
    board_3.set_square(:NE, :X)
    @moves.add(board_3, :lose)
    @moves.add(board_3, :lose)
    @moves.add(board_3, :draw)

    assert_equal(board_2, @moves.best_move)
  end

end