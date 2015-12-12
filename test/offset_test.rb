require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_can_initialize_key_offset_with_a_set_key
    key = "41521"
    off = Offset.new(key)

    assert_equal 41, off.a_key_offset
    assert_equal 15, off.b_key_offset
    assert_equal 52, off.c_key_offset
    assert_equal 21, off.d_key_offset
  end

  def test_it_can_initialize_with_date
    date = "101215"
    key = "41521"
    off = Offset.new(key, date)

    assert_equal date, off.date
  end

  def test_it_can_square_date_and_return_in_array
    date = "101215"
    key = "41521"
    off = Offset.new(key, date)

    assert_equal ["1", "0", "2", "4", "4", "4", "7", "6", "2", "2", "5"], off.square_date
  end

  def test_is_can_generate_date_offsets
    date = "101215"
    key = "41521"
    off = Offset.new(key, date)

    assert_equal 6, off.a_date_offset
    assert_equal 2, off.b_date_offset
    assert_equal 2, off.c_date_offset
    assert_equal 5, off.d_date_offset
  end

  def test_it_can_calc_char_rotation
    date = "101215"
    key = "41521"
    off = Offset.new(key, date)

    assert_equal 47, off.a_char_rotation
    assert_equal 17, off.b_char_rotation
    assert_equal 54, off.c_char_rotation
    assert_equal 26, off.d_char_rotation
  end

end
