require './lib/offset'
require './lib/chars'
require 'pry'
class Decrypt

  attr_reader :reverse_offset

  def initialize(encrypted_message, key = nil, date = nil)
    @encrypted_message = encrypted_message
    @character_set = Chars.new
    @offset = Offset.new(key, date)
    @reverse_offset = reverse_offset
  end




  # def decrypt
  #   @offset.num_offset(message).map do |num|
  #     num = num % 39
  #     @character_set.char_map[num]
  #   end.join
  # end



end
