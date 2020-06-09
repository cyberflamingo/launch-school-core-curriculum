puts "Hello! What's your name?"
name = gets.chomp

name = 'Teddy' unless name != ''

teddy_age = rand(20..200)

puts "#{name} is #{teddy_age} years old!"
