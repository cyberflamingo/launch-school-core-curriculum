def count(collection)
  counter = 0

  collection.each do |element|
    counter += 1 if yield(element)
  end

  counter
end

p count([1, 2, 3, 4, 5], &:odd?) == 3
p count([1, 2, 3, 4, 5]) { |value| value % 3 == 1 } == 2
p count([1, 2, 3, 4, 5]) { |_value| true } == 5
p count([1, 2, 3, 4, 5]) { |_value| false } == 0
p count([], &:even?) == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
