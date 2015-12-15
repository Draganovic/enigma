require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/offset'

class DecryptTest < Minitest::Test

  def test_it_can_decrypt_a_message
    encrypted_message = "k"
    date = "101215"
    key = "41521"

    en = Decrypt.new(encrypted_message, key, date)

    assert_equal 'd', en.decrypt
  end


end
