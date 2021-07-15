class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(candidates)
    candidates.select do |candidate|
      candidate.downcase != word && anagram?(candidate.downcase)
    end
  end

  private

  attr_reader :word

  def anagram?(candidate)
    candidate.chars.sort == word.chars.sort
  end
end
