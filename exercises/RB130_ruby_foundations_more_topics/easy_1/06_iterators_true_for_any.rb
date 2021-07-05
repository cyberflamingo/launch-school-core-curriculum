def any?(collection)
  collection.each { |element| return true if yield(element) }

  false
end

p any?([1, 3, 5, 6], &:even?) == true
p any?([1, 3, 5, 7], &:even?) == false
p any?([2, 4, 6, 8], &:odd?) == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |_value| true } == true
p any?([1, 3, 5, 7]) { |_value| false } == false
p any?([]) { |_value| true } == false
