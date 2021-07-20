class Scrabble
  ALPHABET = ('A'..'Z').to_a
  TILE_SCORES = { 1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
                  2 => ['D', 'G'],
                  3 => ['B', 'C', 'M', 'P'],
                  4 => ['F', 'H', 'V', 'W', 'Y'],
                  5 => ['K'],
                  8 => ['J', 'X'],
                  10 => ['Q', 'Z'] }

  def initialize(word)
    @word = valid?(word) ? word : ''
    @chars = @word.upcase.chars
  end

  def score
    return 0 if @chars.empty?

    @chars.map do |char|
      TILE_SCORES.select do |_k, v|
        v.include?(char)
      end.keys.first
    end.reduce(:+)
  end

  def self.score(word)
    new(word).score
  end

  private

  def valid?(word)
    word.is_a?(String) &&
      word.size > 0 &&
      word.upcase.chars.all? { |letter| ALPHABET.include?(letter) }
  end
end
