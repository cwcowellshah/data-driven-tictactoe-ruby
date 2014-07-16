require_relative 'win_lose_record'

class PossibleMoves

  def initialize
    @moves = Hash.new
  end

  def best_move
    best_win_percent = 0
    best_move = nil
    @moves.keys.each do |move|
      win_percent = @moves[move].win_percent
      if win_percent > best_win_percent
        best_move = move
        best_win_percent = win_percent
      end
    end
    best_move
  end

  def add(move, result)
    win_lose_record = @moves[move]
    if win_lose_record.nil?
      win_lose_record = WinLoseRecord.new
      @moves[move] = win_lose_record
    end

    case result
      when :win
        win_lose_record.add_win
      when :lose
        win_lose_record.add_loss
      when :draw
        win_lose_record.add_draw
      else
        raise "ERROR in PossibleMoves#add: can't recognize result #{result}"
    end
  end

end