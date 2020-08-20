def staggered_case(string, orientation)
  result = ''

  if orientation == 'up'
    need_upper = true
  else
    need_upper = false
  end

  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!', 'down') == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', 'up') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', 'down') == 'iGnOrE 77 tHe 444 nUmBeRs'
