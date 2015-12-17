require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/offset'

class DecryptTest < Minitest::Test

  def test_it_can_take_a_empty_string
    message = ""
    date = "101215"
    key = "41521"

    de = Decrypt.new(message, key, date)

    assert_equal '', de.decrypt
  end

  def test_it_can_initialize
    encrypted_message = 'm'
    date = "101215"
    key = "41521"

    en = Decrypt.new(encrypted_message, key, date)

    assert_equal 'F', en.decrypt
  end

  def test_it_can_decrypt_a_letter
    encrypted_message = "k"
    date = "101215"
    key = "41521"

    en = Decrypt.new(encrypted_message, key, date)

    assert_equal 'D', en.decrypt
  end

  def test_it_can_decrypt_a_message
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
    date = "101215"
    key = "41521"

    de = Decrypt.new(encrypted_message, key, date)

    assert_equal 'This is so secret ..end..', de.decrypt
  end

end
