def leading_substrings(str)
  substrings = []

  str.size.times do |index|
    substrings << str[0..index]
  end

  substrings
end

def substrings(string)
  result = []

  0.upto(string.size - 1) do |index|
    result << leading_substrings(string[index..string.size])
  end

  result.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
