def count(*collection)
  collection.inject(0) do |sum, element|
    yield(element) ? sum + 1 : sum
  end
end

p count(1, 3, 6, &:odd?) == 2
p count(1, 3, 6, &:even?) == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |_value| true } == 3
p count() { |_value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
