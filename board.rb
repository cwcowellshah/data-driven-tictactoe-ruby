class Board

  EMPTY = :_
  PRNG = Random.new  # pseudorandom number generator
  SQUARE_NAMES = [:NW, :N, :NE, :W, :M, :E, :SW, :S, :SE]

  def initialize(board_model = nil)
    @squares = Hash.new(EMPTY)
    SQUARE_NAMES.each { |square_name| set_square(square_name, board_model.get_square(square_name)) } unless board_model.nil?
  end

  def set_square(square_name, player)
    @squares[square_name] = player
  end

  def get_square(square_name)
    @squares[square_name]
  end

  def to_s
    "#{get_square :NW}#{get_square :N}#{get_square :NE}\n#{get_square :W}#{get_square :M}#{get_square :E}\n#{get_square :SW}#{get_square :S}#{get_square :SE}"
  end

  def to_s_flat
    "#{get_square :NW}#{get_square :N}#{get_square :NE} #{get_square :W}#{get_square :M}#{get_square :E} #{get_square :SW}#{get_square :S}#{get_square :SE}"
  end

  def find_row_winner
    [[:NW, :N, :NE], [:W, :M, :E], [:SW, :S, :SE]].each do |trio|
      trio_result = check_three_squares_for_winner(*trio)
      return trio_result unless trio_result.nil?
    end
    nil
  end

  def find_col_winner
    [[:NW, :W, :SW], [:N, :M, :S], [:NE, :E, :SE]].each do |trio|
      trio_result = check_three_squares_for_winner(*trio)
      return trio_result unless trio_result.nil?
    end
    nil
  end

  def find_diag_winner
    [[:NW, :M, :SE], [:NE, :M, :SW]].each do |trio|
      trio_result = check_three_squares_for_winner(*trio)
      return trio_result unless trio_result.nil?
    end
    nil
  end

  def check_three_squares_for_winner(pos1, pos2, pos3)
    [:X, :O].each do |player|
      match = true
      [pos1, pos2, pos3].each do |direction|
        match = match && get_square(direction) == player
      end
      return player if match
    end
    nil
  end

  def get_winner
    return find_row_winner if find_row_winner != nil
    return find_col_winner if find_col_winner != nil
    return find_diag_winner if find_diag_winner != nil
    nil
  end

  def random_square
    SQUARE_NAMES.sample
  end

  def empty?(square)
    get_square(square) == EMPTY
  end

  def auto_move(player, trace)
    candidate_square = nil  # assign here so scope exists beyond the loop
    loop do
      candidate_square = random_square
      break if empty? candidate_square
    end
    accepted_square = candidate_square
    set_square accepted_square, player
    trace.add player, accepted_square
  end

  def eql?(other)
    self.hash == other.hash
  end

  def hash
    to_s_flat.hash
  end

end
