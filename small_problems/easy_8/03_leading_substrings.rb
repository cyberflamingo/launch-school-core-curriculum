def leading_substrings(string)
  substrings = Array.new

  string.size.times do |index|
    substrings << string[0..index]
  end

  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
