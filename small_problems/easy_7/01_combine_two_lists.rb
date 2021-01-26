def interleave(arr1, arr2)
  result = []

  arr1.each_with_index do |object, index|
    result << object
    result << arr2[index]
  end

  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
