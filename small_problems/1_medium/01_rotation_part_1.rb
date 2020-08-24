def rotate_array(list)
  rotated_list = []
  rotation_end_index = list.size - 1

  (1..rotation_end_index).each do |index|
    rotated_list << list[index]
  end

  rotated_list.push(list[0])
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
