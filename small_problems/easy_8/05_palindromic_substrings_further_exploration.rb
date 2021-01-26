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
    unless result.include?(string[index..string.size])
      result << leading_substrings(string[index..string.size])
    end
  end

  result.flatten!

  result.each do |substr|
    substr.gsub!(/[^A-Za-z0-9]/, '')
  end

  result
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
  "ll", "madam", "madam", "madamdidmadam", "madamdidmadam", "madam", "madam",
  "madamdidmadam", "madamdidmadam", "ada", "adamdidmada", "damdidmad",
  "amdidma", "mdidm", "did", "did", "did", "did", "madam", "madam", "madam",
  "madam", "ada", "oo"
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
