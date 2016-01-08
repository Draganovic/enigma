require 'minitest/autorun'
require 'minitest/pride'
require './lib/chars'
require 'simplecov'
SimpleCov.start

class CharsTest < Minitest::Test

  def test_it_can_find_first_char
    ch = Chars.new

    assert_equal "a", ch.char_map.first
  end

  def test_it_can_find_last_char
    ch = Chars.new

    assert_equal ",", ch.char_map.last
  end

  def test_it_can_find_32nd_char
    ch = Chars.new

    assert_equal "6", ch.char_map[32]
  end

end
