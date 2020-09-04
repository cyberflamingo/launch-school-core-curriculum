def mismatch?(parenthesis)
  parenthesis[:opening] < parenthesis[:closing]
end

def balanced?(string)
  parenthesis = { opening: 0, closing: 0 }
  mismatch = false

  string.chars.each do |char|
    case char
    when '(' then parenthesis[:opening] += 1
    when ')' then parenthesis[:closing] += 1
    end

    mismatch = mismatch?(parenthesis)
    break if mismatch
  end

  return false if parenthesis[:opening] != parenthesis[:closing]
  !mismatch
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
