def find_fibonacci_index_by_length(length)
  first = 1
  second = 1
  third = first + second

  index = 3

  while third.to_s.size != length
    first = second
    second = third
    third = first + second

    index += 1
  end

  index
end

p find_fibonacci_index_by_length(2) == 7        # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12       # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
