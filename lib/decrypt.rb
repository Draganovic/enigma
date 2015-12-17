require './lib/offset'
require './lib/chars'
require 'pry'
class Decrypt

  attr_reader :reverse_offset, :encrypted_message

  def initialize(encrypted_message = nil, key = Random.rand(0..9999).to_s, date = Time.now.strftime('%d%m%y').to_i)
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

if __FILE__ == $0
  encrypted = ARGV[0]
  decrypted = ARGV[1]
  82648 == ARGV[2]
  030415 == ARGV[3]
  encrypted = File.read(ARGV[0], ARGV[2], ARGV[3])
  encrypted.delete!("\n")
  de = Decrypt.new(encrypted)
  decrypted = de.decrypt
  handle = File.open(ARGV[1], "w")
  handle.write(decrypted)
  puts "Created #{ARGV[1]} with a key #{ARGV[2]} and date #{ARGV[3]}"
end
