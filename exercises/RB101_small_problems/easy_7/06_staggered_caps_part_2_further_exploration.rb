def staggered_case(string, count_alpha_only)
  result = ''
  need_upper = true

  string.chars.each do |char|
    if count_alpha_only && char =~ /[^A-Za-z]/
      result += char
      next
    elsif need_upper
      result += char.upcase
    else
      result += char.downcase
    end

    need_upper = !need_upper
  end

  result
end

p staggered_case('I Love Launch School!', true) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL_CAPS', false) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 nUmBeRs'
