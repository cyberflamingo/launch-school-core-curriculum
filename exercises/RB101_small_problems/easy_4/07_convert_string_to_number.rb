DIGITS = ('0'..'9').to_a

def string_to_integer(string)
  power = 1

  integer = string.chars.reverse.map.with_index do |character, index|
    power *= 10 unless index == 0
    DIGITS.index(character) * power
  end

  integer.sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
