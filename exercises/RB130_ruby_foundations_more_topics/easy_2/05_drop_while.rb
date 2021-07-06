def drop_while(collection)
  result = []
  drop = true

  collection.each do |element|
    if !drop
      result << element
      next
    end

    drop = yield(element)
    result << element unless drop
  end

  result
end

p drop_while([1, 3, 5, 6], &:odd?) == [6]
p drop_while([1, 3, 5, 6], &:even?) == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |_value| true } == []
p drop_while([1, 3, 5, 6]) { |_value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |_value| true } == []
