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

def palindromes(string)
  substrs = substrings(string)
  palindromes = []

  substrs.each do |substr|
    if substr.size > 1 && substr.reverse == substr
      palindromes << substr
    end
  end

  palindromes
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
