require_relative 'board'
require_relative 'possible_moves'

class BigDataOnePlayer

  def initialize
    @big_data_one_player = Hash.new
  end

  def add_move(board, move, result)
    @big_data_one_player[board] = PossibleMoves.new unless @big_data_one_player[board]
    @big_data_one_player[board].add(move, result)
  end

  def best_move(board)
    @big_data_one_player[board].nil? ? nil : @big_data_one_player[board].best_move
  end

  def debug_print_boards
    boards = @big_data_one_player.keys
    boards.sort! { |a, b| a.to_s_flat <=> b.to_s_flat }
    boards.each { |board| puts board.to_s_flat }
  end

  def num_boards
    @big_data_one_player.size
  end

end