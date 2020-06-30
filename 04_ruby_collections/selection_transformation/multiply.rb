def multiply(numbers_list, criteria)
  counter = 0
  multiplied_numbers = []

  loop do
    break if counter == numbers_list.size
    multiplied_numbers << numbers_list[counter] * criteria

    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
