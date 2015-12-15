require 'pry'
require './lib/offset'
require './lib/chars'
class Encrypt

  attr_reader :message

  def initialize(message = nil, key = nil, date = nil)
    @message = message
    @character_set = Chars.new
    @offset = Offset.new(key, date)
  end

  def letter_position
    letters = @message.downcase.split("")
    letters.reduce([]) do |letter_pos, letter|
      letter_pos << @character_set.char_map.index(letter)
    end
  end

  def encrypt
    @offset.num_offset(message).map do |num|
      num = (num % 39) - 1
      @character_set.char_map[num]
    end.join
  end

end
