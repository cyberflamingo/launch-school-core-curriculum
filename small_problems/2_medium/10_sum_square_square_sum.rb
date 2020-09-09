def square_sum(list)
  list.reduce(:+)**2
end

def sum_square(list)
  list.reduce { |product, n| product + n**2 }
end

def sum_square_difference(int)
  int_list = (1..int).to_a

  square_sum_result = square_sum(int_list)
  sum_square_result = sum_square(int_list)

  square_sum_result - sum_square_result
end

p sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
