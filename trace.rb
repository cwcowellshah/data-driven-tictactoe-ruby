class Trace

  def initialize()
    @trace = []
  end

  def add(player, move)
    @trace << [player, move]
  end

  def steps
    @trace
  end

end
