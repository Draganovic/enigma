class Chars

  attr_reader :char_map

  def char_map
    char_map = ('a'..'z').to_a + ('0'..'9').to_a + [' ', '.', ',']
  end

end
