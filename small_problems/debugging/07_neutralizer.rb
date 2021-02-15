def neutralize(sentence)
  words = sentence.split(' ')
  clean_words = Array.new

  words.each do |word|
    clean_words << word unless negative?(word)
  end

  clean_words.join(' ')
end

def negative?(word)
  ['dull',
   'boring',
   'annoying',
   'chaotic'].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
