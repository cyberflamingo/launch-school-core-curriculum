require 'pry'

def max_by(collection)
  return nil if collection.empty?

  results = []
  collection.each { |element| results << yield(element) }

  collection[results.index(results.max)]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]], &:size) == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 }.nil?
