require 'pry'
require 'simplecov'
SimpleCov.start
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

    assert_equal 'k', en.encrypt
  end

  def test_it_can_encrypt_letter_a
    message = "a"
    date = "101215"
    key = "41521"

    en = Encrypt.new(message, key, date)

    assert_equal 'h', en.encrypt
  end

  def test_it_can_encrypt_a_message
    message = "you are a wizard harry"
    date = "101215"
    key = "41521"

    en = Encrypt.new(message, key, date)

    assert_equal '548wh7swhn 76q52exodyb', en.encrypt
  end

  def test_it_can_encrypt_a_name
    message = "admir"
    date = "101215"
    key = "41521"

    en = Encrypt.new(message, key, date)

    assert_equal 'ht07y', en.encrypt
  end

  def test_it_can_encrypt_message
    message = "This is so secret ..end.."
    date = "101215"
    key = "41521"

    en = Encrypt.new(message, key, date)

    assert_equal '0xweey6wz4lels530nmxl3rxf', en.encrypt
  end

  def test_it_can_take_a_empty_string
    message = ''
    date = "101215"
    key = "41521"

    en = Encrypt.new(message, key, date)

    assert_equal '', en.encrypt
  end


end
