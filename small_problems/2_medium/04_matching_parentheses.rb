def balanced?(string)
  opening_parenthesis = string.chars.count { |char| char =~ /\(/ }
  closing_parenthesis = string.chars.count { |char| char =~ /\)/ }

  return true if opening_parenthesis == 0 && closing_parenthesis == 0
  opening_parenthesis == closing_parenthesis && string.include?(/\(.*\)/.to_s)
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
