require './lib/offset'
require './lib/chars'
require 'pry'
class Decrypt

  attr_reader :reverse_offset, :encrypted_message

  def initialize(encrypted_message =nil, key = nil, date = nil)
    @encrypted_message = encrypted_message
    @character_set = Chars.new
    @offset = Offset.new(key, date)
  end

  def decrypt
    @offset.reverse_num_offset(encrypted_message).map do |num|
      num = (num % 39) + 1
      @character_set.char_map[num]
    end.join.capitalize
  end

end
