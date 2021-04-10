arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |ele|
  ele.select do |num|
    num % 3 == 0
  end
end

p new_arr
