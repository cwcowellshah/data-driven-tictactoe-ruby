require 'test/unit'
require_relative 'board'

class BoardTest < Test::Unit::TestCase

  def setup
    @board = Board.new
  end

  def test_board_creation_no_model
    [:NW, :N, :NE, :W, :M, :E, :SW, :S, :SE].each { |square| assert_equal Board::EMPTY, @board.get_square(square) }
  end

  def test_board_creation_with_model
    @board.set_square :N, :X
    @board.set_square :M, :O
    board_copy = Board.new @board
    assert_equal :X, board_copy.get_square(:N)
    assert_equal :O, board_copy.get_square(:M)
  end

  def test_get_square_and_set_square
    @board.set_square :NW, :X
    assert_equal :X, @board.get_square(:NW)
    @board.set_square :SE, :O
    assert_equal :O, @board.get_square(:SE)
    @board.set_square :M, :O
    assert_equal :O, @board.get_square(:M)
  end

  def test_hash_and_eql
    empty_board_1 = Board.new
    empty_board_2 = Board.new
    assert_equal(empty_board_1.hash, empty_board_2.hash)
    assert(empty_board_1.eql?(empty_board_2))

    board_1 = Board.new
    board_1.set_square :NW, :X
    board_1.set_square :SE, :O
    board_2 = Board.new(board_1)
    assert_equal(board_1.hash, board_2.hash)
    assert(board_1.eql?(board_2))
    assert_not_equal(board_1.hash, empty_board_1.hash)
    assert(! board_1.eql?(empty_board_1))
  end

  def test_board_as_hash_key
    h = Hash.new
    b1 = Board.new
    b2 = Board.new
    h[b1] = :X
    assert(h[b2] == :X)
  end

end