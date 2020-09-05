PAIRS = %w(() [] {} "" '')

def open_close_pair(string, parens, pair)
  string.each_char do |char|
    parens += 1 if char == pair[0]
    parens -= 1 if char == pair[1]
    break if parens < 0
  end

  parens
end

def identical_pair(string, parens, pair)
  string.each_char do |char|
    parens += 1 if char == pair[0]
  end

  parens = 0 if parens.even?

  parens
end

def balanced?(string)
  parens = 0

  PAIRS.each do |pair|
    if pair[0] != pair[1]
      parens = open_close_pair(string, parens, pair)
    else
      parens = identical_pair(string, parens, pair)
    end
  end

  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
puts "\n"

p balanced?('What [is] this?') == true
p balanced?('What is] this?') == false
p balanced?('What [is this?') == false
p balanced?('[[What] [is this]]?') == true
p balanced?('[[What]] [is this]]?') == false
p balanced?('Hey!') == true
p balanced?(']Hey![') == false
p balanced?('What [[is]]] up[') == false
puts "\n"

p balanced?('What {is} this?') == true
p balanced?('What is} this?') == false
p balanced?('What {is this?') == false
p balanced?('{{What} {is this}}?') == true
p balanced?('{{What}} {is this}}?') == false
p balanced?('Hey!') == true
p balanced?('}Hey!{') == false
p balanced?('What {{is}}} up{') == false
puts "\n"

p balanced?('What "is" this?') == true
p balanced?('What is" this?') == false
p balanced?('What "is this?') == false
p balanced?('""What" "is this""?') == true
p balanced?('""What"" "is this""?') == false
p balanced?('Hey!') == true
p balanced?('"Hey!"') == true
p balanced?('What ""is""" up"') == true
puts "\n"

p balanced?("What 'is' this?") == true
p balanced?("What is' this?") == false
p balanced?("What 'is this?") == false
p balanced?("''What' 'is this''?") == true
p balanced?("''What'' 'is this''?") == false
p balanced?("Hey!") == true
p balanced?("'Hey!'") == true
p balanced?("What ''is''' up'") == true
