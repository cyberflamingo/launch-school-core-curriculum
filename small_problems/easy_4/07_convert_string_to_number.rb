DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0
}

def string_to_integer(string)
  digits = string.chars.map do |char|
    DIGITS[char]
  end

  value = 0

  digits.each do |digit|
    value = 10 * value + digit
  end

  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
