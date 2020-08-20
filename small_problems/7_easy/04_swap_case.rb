SWAPCASE = (('a'..'z').to_a).zip('A'..'Z').to_h

def swapcase(string)
  chars_array = string.chars.map do |char|
    if SWAPCASE.values_at(char)[0]
      char = SWAPCASE.values_at(char)
    elsif SWAPCASE.key(char)
      char = SWAPCASE.key(char)
    end

    char
  end

  chars_array.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
