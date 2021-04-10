SWAPCASE = (('a'..'z').to_a).zip('A'..'Z').to_h

def swapcase(string)
  string.chars.map do |char|
    SWAPCASE[char] || char.downcase
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
