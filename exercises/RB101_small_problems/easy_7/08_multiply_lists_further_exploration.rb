def multiply_list(list1, list2)
  list1.zip(list2).map { |a, b| a * b }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
