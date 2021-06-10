def reduce(array, first_num = 0)
  sum = first_num
  index = 0

  while index < array.size
    sum = yield(sum, array[index])

    index += 1
  end

  sum
end

array = [1, 2, 3, 4, 5]

p(reduce(array) { |acc, num| acc + num })
p(reduce(array, 10) { |acc, num| acc + num })
# reduce(array) { |acc, num| acc + num if num.odd? }
