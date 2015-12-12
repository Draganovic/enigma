require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_takes_a_message
    message = "admir"
    en = Encrypt.new(message)

    assert_equal message, en.message
  end

end
