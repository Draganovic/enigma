require './lib/chars'
require 'pry'


class Crack

  attr_accessor :encrypted_message

  def initialize(encrypted_message = nil)
    @encrypted_message = encrypted_message
    @character_set = Chars.new
  end

  def mod_positiion
    encrypted_message.length % 4
  end

  def mod_zero_rotation
    letter_pos = @character_set.char_map.index(encrypted_message[-1])
    @mod_zero_rotation = (letter_pos - @character_set.char_map.index('.')) % @character_set.char_map.length
  end

  def mod_one_rotation
    letter_pos = @character_set.char_map.index(encrypted_message[-2])
    @mod_zero_rotation = (letter_pos - @character_set.char_map.index('.')) % @character_set.char_map.length
  end

  def mod_two_rotation
    letter_pos = @character_set.char_map.index(encrypted_message[-3])
    @mod_zero_rotation = (letter_pos - @character_set.char_map.index('d')) % @character_set.char_map.length
  end

  def mod_three_rotation
    letter_pos = @character_set.char_map.index(encrypted_message[-4])
    @mod_zero_rotation = (letter_pos - @character_set.char_map.index('n')) % @character_set.char_map.length
  end

  def crack
    @rotations = []
    if mod_positiion == 0
      @rotations << mod_three_rotation << mod_two_rotation << mod_one_rotation << mod_zero_rotation
    elsif mod_positiion == 1
      @rotations << mod_zero_rotation << mod_three_rotation << mod_two_rotation << mod_one_rotation
    elsif mod_positiion == 2
      @rotations << mod_one_rotation << mod_zero_rotation << mod_three_rotation << mod_two_rotation
    else mod_positiion == 3
      @rotations << mod_two_rotation << mod_one_rotation << mod_zero_rotation << mod_three_rotation
    end
    @rotations
  end


end
