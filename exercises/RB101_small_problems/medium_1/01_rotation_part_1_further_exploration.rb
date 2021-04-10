def rotate_array(list)
  rotated_list = list.dup
  rotated_list << rotated_list.shift

  rotated_list
end

def rotate_string(str)
  rotate_array(str.split('')).join
end

def rotate_integers(int)
  rotate_array(int.to_s.split('')).join.to_i
end

# Rotate strings
p rotate_string('735291') == '352917'
p rotate_string('abc') == 'bca'
p rotate_string('a') == 'a'

x = '1234'
p rotate_string(x) == '2341' # => true
p x == '1234' # => true

# Rotate integers
p rotate_integers(735291) == 352917
p rotate_integers(123) == 231
p rotate_integers(1) == 1

y = 1234
p rotate_integers(y) == 2341 # => true
p y == 1234 # => true
