require 'test/unit'
require_relative 'big_data'

class BigDataTest < Test::Unit::TestCase

  def test_create
    big_data = BigData.new
    assert_equal(BigDataOnePlayer, big_data.get_big_data_one_player(:X).class)
    assert_equal(BigDataOnePlayer, big_data.get_big_data_one_player(:O).class)
  end

  def test_add_data
    big_data = BigData.new

    board_1 = Board.new
    big_data.add_move(:X, board_1, :NW, :win)
    big_data.add_move(:X, board_1, :NW, :win)
    big_data.add_move(:X, board_1, :NW, :lose)
    big_data.add_move(:X, board_1, :NW, :draw)

    big_data.add_move(:X, board_1, :NE, :win)
    big_data.add_move(:X, board_1, :NE, :lose)
    big_data.add_move(:X, board_1, :NE, :draw)

    big_data.add_move(:O, board_1, :NW, :win)
    big_data.add_move(:O, board_1, :NW, :win)
    big_data.add_move(:O, board_1, :NW, :lose)
    big_data.add_move(:O, board_1, :NW, :draw)

    big_data.add_move(:O, board_1, :NE, :win)
    big_data.add_move(:O, board_1, :NE, :lose)
    big_data.add_move(:O, board_1, :NE, :draw)


    board_2 = Board.new
    board_2.set_square(:M, :O)
    big_data.add_move(:X, board_2, :SW, :win)
    big_data.add_move(:X, board_2, :SW, :win)
    big_data.add_move(:X, board_2, :SW, :lose)
    big_data.add_move(:X, board_2, :SW, :draw)

    big_data.add_move(:X, board_2, :SE, :win)
    big_data.add_move(:X, board_2, :SE, :lose)
    big_data.add_move(:X, board_2, :SE, :draw)

    big_data.add_move(:O, board_2, :SW, :win)
    big_data.add_move(:O, board_2, :SW, :win)
    big_data.add_move(:O, board_2, :SW, :lose)
    big_data.add_move(:O, board_2, :SW, :draw)

    big_data.add_move(:O, board_2, :SE, :win)
    big_data.add_move(:O, board_2, :SE, :lose)
    big_data.add_move(:O, board_2, :SE, :draw)

    assert_equal(:NW, big_data.best_move(:X, board_1))
    assert_equal(:SW, big_data.best_move(:X, board_2))
    assert_equal(:NW, big_data.best_move(:O, board_1))
    assert_equal(:SW, big_data.best_move(:O, board_2))
  end

end