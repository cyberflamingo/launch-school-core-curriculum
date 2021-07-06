def zip(arr1, arr2)
  arr1.map.with_index do |_, index|
    [arr1[index], arr2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
