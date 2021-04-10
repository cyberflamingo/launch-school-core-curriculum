puts "Hello! What's your name?"
name = gets.chomp

name = 'Teddy' if name.strip.empty?

teddy_age = rand(20..200)

puts "#{name} is #{teddy_age} years old!"
