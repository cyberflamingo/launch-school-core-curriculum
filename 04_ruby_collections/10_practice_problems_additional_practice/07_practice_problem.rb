statement = "The Flintstones Rock"

letters_list = statement.split(//).sort

letters_list.delete(' ')

letters_frequency = {}

letters_list.each do |letter|
  if letters_frequency.key?(letter)
    letters_frequency[letter] += 1
  else
    letters_frequency[letter] = 1
  end
end

p letters_frequency
