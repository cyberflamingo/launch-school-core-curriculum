def reduce(array, default = nil)
  sum = default.nil? ? array.first : default
  index = 1

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
p(reduce(['a', 'b', 'c']) { |acc, value| acc += value })
p(reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value })
