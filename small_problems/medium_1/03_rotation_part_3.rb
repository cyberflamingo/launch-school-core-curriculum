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

def max_rotation(number)
  (number.to_s.size).downto(2) do |index|
    number = rotate_rightmost_digits(number, index)
  end

  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
# Further Exploration
p max_rotation(87_003_529_146) == 70_594_831_062 # No error with the two zeros
