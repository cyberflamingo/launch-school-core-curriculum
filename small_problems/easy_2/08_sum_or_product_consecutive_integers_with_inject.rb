def prompt(message)
  puts ">> #{message}"
end

operator = ["sum", "product"]

operator_letter = operator.map do |val|
  val[0]
end

int = 1
loop do
  prompt("Please enter an integer greater than 0:")
  int = gets.to_i

  break if int > 0
end

selected_operator = ''
loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  selected_operator = gets.chomp

  break if operator_letter.include?(selected_operator)
end

if selected_operator == 's'
  result = (1..int).inject(:+)
  puts "The sum of the integers between 1 and #{int} is #{result}."
elsif selected_operator == 'p'
  result = (1..int).inject(:*)
  puts "The product of the integers between 1 and #{int} is #{result}."
else
  puts "I didn't get that"
end
