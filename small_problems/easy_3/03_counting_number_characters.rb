puts "Please write word or multiple words:"
input = gets.chomp

no_space = input.gsub(' ', '')
p no_space
puts "There are #{no_space.size} characters in " + input + "."
