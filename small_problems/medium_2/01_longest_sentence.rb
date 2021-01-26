END_CHARACTERS = %w(. ! ?)

def end_with_ponctuation?(word)
  END_CHARACTERS.each do |character|
    return true if word.end_with?(character)
  end

  false
end

def separate_sentences(text)
  sentences = []
  sentence_index = 0
  sentences[sentence_index] = []

  text.each do |word|
    sentences[sentence_index] << word

    if end_with_ponctuation?(word)
      sentence_index += 1
      sentences[sentence_index] = []
    end
  end

  sentences
end

def longest_sentence(text)
  file = File.open(text)
  file_data = file.read.split
  file.close

  sentences = separate_sentences(file_data)
  largest_sentence = sentences.max_by(&:size)
  number_of_words = largest_sentence.size

  puts largest_sentence.join(' ')
  puts "Contains #{number_of_words} words."

  number_of_words
end

p longest_sentence('01_longest_sentence_example_text.txt') == 86
p longest_sentence('01_longest_sentence_frankenstein.txt') == 157
