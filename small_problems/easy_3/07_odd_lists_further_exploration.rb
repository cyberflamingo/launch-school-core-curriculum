def oddities(array)
  odd_array = array.map.with_index do |value, index|
    if index.odd?
      value
    end
  end
  odd_array.compact
end

p oddities([2, 3, 4, 5, 6]) == [3, 5]
p oddities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['def']
p oddities([123]) == []
p oddities([]) == []

def oddities_2(array)
  odd_array = []
  i = 1
  while i < array.size
    odd_array << array[i]
    i += 2
  end
  odd_array
end

p oddities_2([2, 3, 4, 5, 6]) == [3, 5]
p oddities_2([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_2(['abc', 'def']) == ['def']
p oddities_2([123]) == []
p oddities_2([]) == []
