require 'pry'
require './lib/encrypt'
class Offset



  attr_reader :key, :date

  def initialize(key = Random.rand(0..9999).to_s, date = Time.now.strftime('%d%m%y').to_i)
    @key = key
    @date = date
    @rotations
  end

  def square_date
    date_squared = @date.to_i ** 2
    date_squared.to_s.split('')
  end

  def a_date_offset
    square_date[-4].to_i
  end

  def b_date_offset
    square_date[-3].to_i
  end

  def c_date_offset
    square_date[-2].to_i
  end

  def d_date_offset
    square_date[-1].to_i
  end

  def a_key_offset
    key_offset = @key[0..1].to_i
  end

  def b_key_offset
    key_offset = @key[1..2].to_i
  end

  def c_key_offset
    key_offset = @key[2..3].to_i
  end

  def d_key_offset
    key_offset = @key[3..4].to_i
  end

  def a_char_offset
    a_key_offset + a_date_offset
  end

  def b_char_offset
    b_key_offset + b_date_offset
  end

  def c_char_offset
    c_key_offset + c_date_offset
  end

  def d_char_offset
    d_key_offset + d_date_offset
  end

  def character_offset
    {
      0 => a_char_offset,
      1 => b_char_offset,
      2 => c_char_offset,
      3=> d_char_offset
    }
  end

  def num_offset(message)
    count = 0
    en = Encrypt.new(message)
    en.letter_position.map do |lp|
      lp += character_offset[count]
      count == 3 ? count = 0 : count += 1
      lp
    end
  end

  def reverse_num_offset(message)
    count = 0
    en = Encrypt.new(message)
    en.letter_position.map do |lp|
      lp -= character_offset[count]
      count == 3 ? count = 0 : count += 1
      lp
    end
  end

end
