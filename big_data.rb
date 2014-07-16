require_relative 'big_data_one_player'
require_relative 'board'
require_relative 'trace'

class BigData

  def initialize
    @big_data = Hash.new
    @big_data[:X] = BigDataOnePlayer.new
    @big_data[:O] = BigDataOnePlayer.new
  end

  def get_big_data_one_player(player)
    @big_data[player]
  end

  def add_move(player, board, move, result)
    @big_data[player].add_move(board, move, result)
  end

  def best_move(player, board)
    @big_data[player].best_move(board)
  end

  def add_trace(trace, winner)
    board = Board.new
    trace.steps.each do |player, move|
      if winner == player
        result = :win
      elsif winner == :none
        result = :draw
      else
        result = :lose
      end

      board_snapshot = Board.new(board)
      add_move(player, board_snapshot, move, result)
      board.set_square(move, player)
    end
  end

end