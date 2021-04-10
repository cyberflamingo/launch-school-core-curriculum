def middle(words)
  words_array = words.split
  words_array_size = words_array.size

  # Take last word of the first half for even sentences
  if words_array_size.even?
    halfway = (words_array_size - 1) / 2
  else
    halfway = words_array_size / 2
  end

  # Cannot select a word for small sentences
  return '' if words_array_size <= 2
  words_array[halfway]
end

p middle('last word') == ''
p middle('Launch School is great!') == 'School'
p middle("My name is Yoshikage Kira. I'm 33 years old.") == 'Kira.'
p middle('') == ''
