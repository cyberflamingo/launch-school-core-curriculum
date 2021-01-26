ALPHABET = ('a'..'z').to_a

def delete_non_letters(string)
  letters_only = string.chars.map do |char|
    char if ALPHABET.include?(char.downcase)
  end

  letters_only.compact.join
end

def word_sizes(words_string)
  count = Hash.new(0)

  words_string.split.each do |word|
    letters_only = delete_non_letters(word)
    count[letters_only.length] += 1
  end

  count
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
