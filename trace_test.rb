require 'test/unit'
require_relative 'trace'

class TraceTest < Test::Unit::TestCase

  def test_add_and_steps
    trace = Trace.new
    expected_player_1, expected_move_1 = :X, :NW
    expected_player_2, expected_move_2 = :O, :SE

    trace.add(expected_player_1, expected_move_1)
    trace.add(expected_player_2, expected_move_2)

    actual_player_1, actual_move_1 = trace.steps[0]
    actual_player_2, actual_move_2 = trace.steps[1]

    assert_equal(expected_player_1, actual_player_1)
    assert_equal(expected_move_1, actual_move_1)
    assert_equal(expected_player_2, actual_player_2)
    assert_equal(expected_move_2, actual_move_2)
  end

end