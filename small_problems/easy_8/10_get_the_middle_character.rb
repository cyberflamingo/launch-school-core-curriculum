def center_of(string)
  string_size = string.size
  half_string_size = string_size / 2

  if string_size.even?
    string[half_string_size - 1, 2]
  else
    string[half_string_size]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
