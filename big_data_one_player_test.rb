require 'test/unit'
require_relative 'big_data_one_player'
require_relative 'board'

class BigDataOnePlayerTest < Test::Unit::TestCase

  def test_add_data_one_board
    big_data_one_player = BigDataOnePlayer.new
    board = Board.new

    # start by having NW be best move
    big_data_one_player.add_move(board, :NW, :win)
    assert_equal(:NW, big_data_one_player.best_move(board))

    # add more data so now NE is best move
    big_data_one_player.add_move(board, :NW, :lose)
    big_data_one_player.add_move(board, :NE, :win)
    big_data_one_player.add_move(board, :NE, :win)
    assert_equal(:NE, big_data_one_player.best_move(board))

    # now back to NW being best move
    big_data_one_player.add_move(board, :NW, :win)
    big_data_one_player.add_move(board, :NW, :win)
    big_data_one_player.add_move(board, :NW, :win)
    big_data_one_player.add_move(board, :NE, :lose)
    assert_equal(:NW, big_data_one_player.best_move(board))
  end

  def test_add_data_two_boards
    big_data_one_player = BigDataOnePlayer.new

    board_1 = Board.new
    big_data_one_player.add_move(board_1, :NW, :win)
    big_data_one_player.add_move(board_1, :NW, :win)
    big_data_one_player.add_move(board_1, :NW, :lose)
    big_data_one_player.add_move(board_1, :NW, :draw)
    big_data_one_player.add_move(board_1, :NE, :win)
    big_data_one_player.add_move(board_1, :NE, :lose)
    big_data_one_player.add_move(board_1, :NE, :draw)

    board_2 = Board.new
    board_2.set_square(:M, :O)
    big_data_one_player.add_move(board_2, :SW, :win)
    big_data_one_player.add_move(board_2, :SW, :win)
    big_data_one_player.add_move(board_2, :SW, :lose)
    big_data_one_player.add_move(board_2, :SW, :draw)
    big_data_one_player.add_move(board_2, :SE, :win)
    big_data_one_player.add_move(board_2, :SE, :lose)
    big_data_one_player.add_move(board_2, :SE, :draw)

    assert_equal(:NW, big_data_one_player.best_move(board_1))
    assert_equal(:SW, big_data_one_player.best_move(board_2))
  end

end