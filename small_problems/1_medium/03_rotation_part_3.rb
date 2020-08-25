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

def max_rotation(number)
  digits_size = number.to_s.size

  rotated_digits = rotate_rightmost_digits(number, digits_size)
  i = digits_size - 1
  while i > 0
    rotated_digits = rotate_rightmost_digits(rotated_digits, i)
    i -= 1
  end

  rotated_digits
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
