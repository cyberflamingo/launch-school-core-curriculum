def leading_substrings(string)
  substrings = Array.new

  string.size.times do |index|
    raw_substrings = string[0..index]
    substrings << raw_substrings.downcase.gsub(/[^a-z0-9]/, '')
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

def palindromes(string)
  substrings_list = substrings(string)

  substrings_list.select do |substring|
    substring.size > 1 && substring == substring.reverse
  end
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
