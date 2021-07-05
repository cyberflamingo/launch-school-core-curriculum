def one?(collection)
  counter = 0

  collection.each do |element|
    counter += 1 if yield(element)
    return false if counter > 1
  end

  counter == 1
end

p one?([1, 3, 5, 6], &:even?) == true
p one?([1, 3, 5, 7], &:odd?) == false
p one?([2, 4, 6, 8], &:even?) == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |_value| true } == false
p one?([1, 3, 5, 7]) { |_value| false } == false
p one?([]) { |_value| true } == false
