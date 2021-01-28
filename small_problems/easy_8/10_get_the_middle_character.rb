def center_of(string)
  string.size.odd? ? is_odd = true : is_odd == false
  string_middle = string.size / 2

  if is_odd
    string.slice(string_middle)
  else
    string.slice((string_middle - 1)..string_middle)
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
