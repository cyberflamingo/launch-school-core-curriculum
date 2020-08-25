def rotate_array(list)
  rotated_list = []
  rotation_end_index = list.size - 1

  (1..rotation_end_index).each do |index|
    rotated_list << list[index]
  end

  rotated_list.push(list[0])
end

def rotate_rightmost_digits(number, n)
  rightmost_digits = number.to_s.split('')[-n..-1]
  rest = number.to_s.split('')[0...-n]
  rotated_rightmost_digits = rotate_array(rightmost_digits)

  (rest.join + rotated_rightmost_digits.join).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
