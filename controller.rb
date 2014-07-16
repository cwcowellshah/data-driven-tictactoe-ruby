require_relative 'big_data'
require_relative 'board'
require_relative 'trace'

class Controller

  def next_player(player)
    (player == :X) ? :O : :X
  end

  def play(board, big_data)
    trace = Trace.new
    player = :X
    9.times do
      board.auto_move player, trace
      break if (@winner = board.get_winner) != nil
      player = next_player player
    end
    big_data.add_trace trace, @winner
  end

  def report(board)
    puts board
    if @winner.nil?
      puts 'draw'
    else
      print "winner: #{@winner} in a "
      puts 'row' unless board.find_row_winner == nil
      puts 'col' unless board.find_col_winner == nil
      puts 'diag' unless board.find_diag_winner == nil
    end
  end

end