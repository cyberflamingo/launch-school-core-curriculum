def prompt(message)
  puts ">> #{message}"
end

def ask_for_integer
  integer = 0

  loop do
    prompt('Please enter an integer greater than 0:')
    integer = gets.to_i

    break if integer > 0
  end

  integer
end

def ask_for_operation
  possible_inputs = ['s', 'p']
  operation = String.new

  loop do
    prompt("Enter 's' to compute the sum, 'p' to compute the product.")
    operation = gets.chomp.downcase[0]

    break if possible_inputs.include?(operation)
  end

  operation
end

def sum_or_product
  min_num = 1
  max_num = ask_for_integer

  operation = ask_for_operation

  case operation
  when 's'
    result = (min_num..max_num).reduce(&:+)
    operation = 'sum'
  when 'p'
    result = (min_num..max_num).reduce(&:*)
    operation = 'product'
  else
    reurn "Error! No operation found."
  end

  puts "The #{operation} of the integers between #{min_num} and " \
       "#{max_num} is #{result}."
end

sum_or_product
