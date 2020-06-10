puts 'What is the bill?'
bill = gets.to_f

puts 'What is the tip percentage?'
tip_percentage = gets.to_f

tip = bill * (tip_percentage / 100)
total = bill + tip

puts "The tip is $#{tip.round(2)}"
puts "The total is $#{total.round(2)}"
