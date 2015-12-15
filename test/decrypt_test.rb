require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/offset'

class DecryptTest < Minitest::Test


  def test_it_can_encrypt_a_position

    message = "admir"
    date = "101215"
    key = "41521"

    de = Decrypt.new(message)
    off = Offset.new(key, date)

    assert_equal [-47, -20, -66, -34, -64], off.reverse_offset(message)
  end

  message = "you are a wizard harry"
  date = "101215"
  key = "41521"

  en = Encrypt.new(message, key, date)

  assert_equal '659xi8txio.87r63fypezc', en.encrypt


  # def test_it_can_decrypt_a_message
  #   encrypted_message = '659xi8txio.87r63fypezc'
  #   date = "101215"
  #   key = "41521"
  #
  #   de = Decrypt.new(encrypted_message, key, date)
  #
  #
  #   assert_equal "you are a wizard harry", de.decrypt
  # end

end
