def longest_paragraph(text)
  file = File.open(text)
  file_data = file.read
  file.close

  paragraphs = file_data.split(/\n\n/)
  largest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
  largest_paragraph = largest_paragraph.strip
  number_of_words = largest_paragraph.split.size

  puts largest_paragraph.to_s
  puts "Containing #{number_of_words} words"

  number_of_words
end

p longest_paragraph('01_longest_sentence_example_text.txt') == 173
p longest_paragraph('01_longest_sentence_frankenstein.txt') == 856
