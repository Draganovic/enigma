require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_it_can_use_char_map
    encrypted_message = nil
    c = Crack.new(encrypted_message)
    char = Chars.new

    assert_equal "a", char.char_map.first
  end

  def test_it_can_take_mod_of_length_of_message
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
                       #"This is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal 1, c.mod_positiion
  end

  def test_mod_zero_rotation
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
                       #"This is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal 7, c.mod_zero_rotation
  end

  def test_mod_one_rotation
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
                       #"This is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal 25, c.mod_one_rotation
  end

  def test_mod_two_rotation
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
                       #"This is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal 14, c.mod_two_rotation
  end

  def test_mod_three_rotation
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
                       #"This is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal 16, c.mod_three_rotation
  end

  def test_mod_zero_rotation_array
    encrypted_message = "xweey6wz4lels530nmxl3rxf"
                       #"his is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal [16, 14, 25, 7], c.rot_calc
  end

  def test_mod_one_rotation_array
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
                       #"This is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal [7, 16, 14, 25], c.rot_calc
  end

  def test_mod_two_rotation_array
    encrypted_message = "eey6wz4lels530nmxl3rxf"
                       #"s is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal [25, 7, 16, 14], c.rot_calc
  end

  def test_mod_three_rotation_array
    encrypted_message = "weey6wz4lels530nmxl3rxf"
                       #"is is so secret ..end.."
    c = Crack.new(encrypted_message)

    assert_equal [14, 25, 7, 16], c.rot_calc
  end

  def test_it_can_get_index_position_of_each_cracked_letter
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
    c = Crack.new(encrypted_message)

    assert_equal [19, 7, 8, 18, 36, 8, 18, 36, 18, 14, 36, 18, 4, 2, 17, 4, 19, 36, 37, 37, 4, 13, 3, 37, 37], c.crack_index(encrypted_message)
  end

  def test_it_can_crack
    encrypted_message = "0xweey6wz4lels530nmxl3rxf"
    c = Crack.new(encrypted_message)

    assert_equal "This is so secret ..end..", c.crack
  end

end
