require 'pry'
class Offset

  attr_reader :key, :date

  def initialize(key = Random.rand(0..9999).to_s, date = Time.now.strftime('%d%m%y').to_i)
    @key = key
    @date = date
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

  def a_char_rotation
    a_key_offset + a_date_offset
  end

  def b_char_rotation
    b_key_offset + b_date_offset
  end

  def c_char_rotation
    c_key_offset + c_date_offset
  end

  def d_char_rotation
    d_key_offset + d_date_offset
  end


end
