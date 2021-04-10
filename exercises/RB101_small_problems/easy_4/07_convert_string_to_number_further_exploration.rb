DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def hexadecimal_to_integer(string)
  string.upcase!

  digits = string.chars.map do |char|
    DIGITS[char]
  end

  value = 0

  digits.each do |digit|
    value = 16 * value + digit
  end

  value
end

p hexadecimal_to_integer('4D9f') == 19871
