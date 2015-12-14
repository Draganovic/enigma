require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require './lib/offset'

class EncryptTest < Minitest::Test

  def test_it_takes_a_message
    message = "admir"
    en = Encrypt.new(message)

    assert_equal message, en.message
  end

  def test_it_can_get_a_letters_position
    message = "b"
    en = Encrypt.new(message)

    assert_equal [1], en.letter_position
  end

  def test_it_can_get_mult_letter_positions
    message = "bd"
    en = Encrypt.new(message)

    assert_equal [1, 3], en.letter_position
  end

  def test_it_can_get_position_with_spaces
    message = "I am hungry"
    en = Encrypt.new(message)

    assert_equal [8, 36, 0, 12, 36, 7, 20, 13, 6, 17, 24], en.letter_position
  end

  def test_it_can_encrypt_a_position
    message = "d"
    date = "101215"
    key = "41521"

    en = Encrypt.new(message, key, date)

    assert_equal 'l', en.encrypt
  end

  def test_it_can_encrypt_a_message
    message = "you are a wizard harry"
    date = "101215"
    key = "41521"

    en = Encrypt.new(message, key, date)

    assert_equal '659xi8txio.87r63fypezc', en.encrypt
  end

end
