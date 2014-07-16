require 'test/unit'
require_relative 'win_lose_record'

class WinLoseRecordTest < Test::Unit::TestCase

  def test_add_win_lose_and_draw
    win_lose_record = WinLoseRecord.new
    assert_equal(0, win_lose_record.win_percent)

    win_lose_record.add_win
    assert_equal(100, win_lose_record.win_percent)

    win_lose_record.add_loss
    assert_equal(50, win_lose_record.win_percent)

    win_lose_record.add_draw
    assert_equal(33, win_lose_record.win_percent)
  end

  def test_win_percent
    win_lose_record = WinLoseRecord.new(7, 2, 1)
    assert_equal(70, win_lose_record.win_percent)

    win_lose_record = WinLoseRecord.new(7, 0, 0)
    assert_equal(100, win_lose_record.win_percent)

    win_lose_record = WinLoseRecord.new(0, 32, 45)
    assert_equal(0, win_lose_record.win_percent)
  end

end
