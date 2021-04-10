def rotate_array(list)
  rotated_list = list.dup
  rotated_list << rotated_list.shift

  rotated_list
end

def rotate_rightmost_digits(number, n)
  leftmost_digits  = number.to_s[0...-n]
  rightmost_digits = rotate_array(number.to_s[-n..-1].chars)

  (leftmost_digits + rightmost_digits.join).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
