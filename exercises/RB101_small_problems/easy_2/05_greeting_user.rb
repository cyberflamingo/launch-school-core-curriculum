puts 'What is your name?'
name = gets.chomp

greeting = "Hello #{name}."

if name.end_with?('!')
  name.chop!
  greeting = "Hello #{name}. Why are we screaming?"
  greeting.upcase!
end

puts greeting
