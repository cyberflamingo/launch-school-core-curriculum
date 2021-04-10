require 'date'

puts 'What is your age?'
age = gets.to_i

puts 'At what age would you like to retire?'
retire_age = gets.to_i

CURRENT_YEAR = DateTime.now.year
work_years = retire_age - age
retire_year = CURRENT_YEAR + work_years

puts "It's #{CURRENT_YEAR}. You will retire in #{retire_year}."
puts "You have only #{work_years} years of work to go!"
