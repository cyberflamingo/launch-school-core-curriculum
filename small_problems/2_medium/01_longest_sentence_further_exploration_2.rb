def longest_word(text)
  file = File.open(text)
  file_data = file.read
  file.close

  words = file_data.split
  largest_word = words.max_by(&:size)
  number_of_characters = largest_word.size

  puts largest_word
  puts "Containing #{number_of_characters} characters"

  number_of_characters
end

p longest_word('01_longest_sentence_example_text.txt') == 11
p longest_word('01_longest_sentence_frankenstein.txt') == 30
