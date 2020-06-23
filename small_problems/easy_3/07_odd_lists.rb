def oddities(array)
  odd_array = array.map.with_index do |value, index|
    if index.even?
      value
    end
  end
  odd_array.compact
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
