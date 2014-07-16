class WinLoseRecord

  def initialize(wins=0, losses=0, draws=0)
    @wins, @losses, @draws = wins, losses, draws
  end

  def win_percent
    begin
      (@wins * 100) / ((@wins + @losses + @draws))
    rescue ZeroDivisionError
      0
    end
  end

  def add_win
    @wins += 1
  end

  def add_loss
    @losses += 1
  end

  def add_draw
    @draws += 1
  end

end