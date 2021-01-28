def leading_substrings(string)
  substrings = Array.new

  string.size.times do |index|
    substrings << string[0..index]
  end

  substrings
end

def substrings(string)
  substrings_list = Array.new

  string.size.times do |index|
    substrings_list << leading_substrings(string[index..-1])
  end

  substrings_list.flatten
end

p substrings('abc') == [
  'a', 'ab', 'abc',
  'b', 'bc',
  'c'
]
p substrings('a') == ['a']
p substrings('xyzzy') == [
  'x', 'xy', 'xyz', 'xyzz', 'xyzzy',
  'y', 'yz', 'yzz', 'yzzy',
  'z', 'zz', 'zzy',
  'z', 'zy',
  'y'
]
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
