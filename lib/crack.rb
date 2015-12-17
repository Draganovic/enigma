require './lib/chars'
require './lib/encrypt'
require './lib/decrypt'
require 'pry'


class Crack

  attr_accessor :encrypted_message, :character_set

  def initialize(encrypted_message = nil)
    @encrypted_message = encrypted_message
    @character_set = Chars.new
  end

  def mod_positiion
    encrypted_message.length % 4
  end

  def mod_zero_rotation
    letter_pos = character_set.char_map.index(encrypted_message[-1])
    (letter_pos - character_set.char_map.index('.')) % character_set.char_map.length
  end

  def mod_one_rotation
    letter_pos = character_set.char_map.index(encrypted_message[-2])
    (letter_pos - character_set.char_map.index('.')) % character_set.char_map.length
  end

  def mod_two_rotation
    letter_pos = character_set.char_map.index(encrypted_message[-3])
    (letter_pos - character_set.char_map.index('d')) % character_set.char_map.length
  end

  def mod_three_rotation
    letter_pos = character_set.char_map.index(encrypted_message[-4])
    (letter_pos - character_set.char_map.index('n')) % character_set.char_map.length
  end

  def rot_calc
    rotations = []
    if mod_positiion == 0
      rotations << mod_three_rotation << mod_two_rotation << mod_one_rotation << mod_zero_rotation
    elsif mod_positiion == 1
      rotations << mod_zero_rotation << mod_three_rotation << mod_two_rotation << mod_one_rotation
    elsif mod_positiion == 2
      rotations << mod_one_rotation << mod_zero_rotation << mod_three_rotation << mod_two_rotation
    else mod_positiion == 3
      rotations << mod_two_rotation << mod_one_rotation << mod_zero_rotation << mod_three_rotation
    end
  end

  def crack_index(encrypted_message)
    rc_index = 0
    en = Encrypt.new(encrypted_message)
    en.letter_position.map do |lp|
      lp -= rot_calc[rc_index]
      lp = make_pos_on_char_map(lp)
      rc_index = rc_increase(rc_index)
      lp
    end
  end

  def crack
    crack_index(encrypted_message).map do |num|
      num = (num % 39)
      character_set.char_map[num]
    end.join.capitalize
  end

  private

  def rc_increase(rc_index)
      rc_index >= 3 ? 0 : rc_index +=1
  end

  def make_pos_on_char_map(lp)
    lp += 39 if lp.between?(-1000, -1)
    lp
  end

end
