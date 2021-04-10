arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |ele|
  ele.select(&:odd?)
end

p new_arr
p new_arr == [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
