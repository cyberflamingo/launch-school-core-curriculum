DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0
}

def string_to_signed_integer(string)
  string_ary = string.chars
  negative_char = false
  value = 0

  negative_char = true if string_ary[0] == '-'
  string_ary.shift if string_ary[0] == '+' || string_ary[0] == '-'

  digits = string_ary.map do |char|
    DIGITS[char]
  end

  digits.each do |digit|
    value = 10 * value + digit
  end

  value *= -1 if negative_char
  value
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
