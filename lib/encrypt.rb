require 'pry'
require './lib/offset'
require './lib/chars'
class Encrypt

  attr_reader :message, :key, :date

  def initialize(message = nil, key = Random.rand(0..9999).to_s, date = Time.now.strftime('%d%m%y').to_i)
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
      num = (num % 39) -1
      @character_set.char_map[num]
    end.join
  end

end

if __FILE__ == $0
  message = ARGV[0]
  encrypted = ARGV[1]
  message = File.read(ARGV[0])
  message.delete!("\n")
  en = Encrypt.new(message)
  encrypted = en.encrypt
  handle = File.open(ARGV[1], "w")
  handle.write(encrypted)
  puts "Created #{ARGV[1]} with a key #{en.key} and date #{en.date}"
end
