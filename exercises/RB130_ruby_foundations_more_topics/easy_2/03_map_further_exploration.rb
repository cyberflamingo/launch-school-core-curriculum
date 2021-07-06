require 'set'

def map(collection)
  collection.each_with_object([]) do |element, result|
    result << yield(element) if block_given?
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |_value| true } == []
p map(['a', 'b', 'c', 'd']) { |_value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd'], &:upcase) == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map([1, 3, 4]) == []

# Hashes:
p map({ a: 1, b: 2, c: 3 }) { |key, value| [key, value * 2] } ==
  [[:a, 2], [:b, 4], [:c, 6]]
p map({}) { |key, value| [key, value * 2] } == []
p map({ a: 1, b: 2 }) == []

# Sets:
p map(Set[1, 3, 5, 6]) { |value| value * 2 } == [2, 6, 10, 12]
p map(Set[]) { |value| value * 2 } == []
p map(Set[3, 1, 2]) == []
