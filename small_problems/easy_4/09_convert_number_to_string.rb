DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  return '0' if int == 0

  value = int
  digits_list = []

  while value != 0
    digits_list << value % 10
    value /= 10
  end

  string_list = digits_list.map do |digit|
    DIGITS[digit]
  end

  string_list.reverse.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
