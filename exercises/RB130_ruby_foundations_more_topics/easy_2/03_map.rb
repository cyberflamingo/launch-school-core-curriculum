def map(collection)
  mapped_collection = []
  collection.each { |element| mapped_collection << yield(element) }

  mapped_collection
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |_value| true } == []
p map(['a', 'b', 'c', 'd']) { |_value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd'], &:upcase) == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
