puts 'What is the bill?'
bill = gets.to_f

puts 'What is the tip percentage?'
tip_percentage = gets.to_f

tip = bill * (tip_percentage / 100)
total = bill + tip

tip = "%.2f" % tip
total = "%.2f" % total

puts "The tip is $#{tip}"
puts "The total is $#{total}"
