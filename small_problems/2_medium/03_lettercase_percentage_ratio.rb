def count_lowercase(string)
  result = 0
  string.chars.each do |char|
    if char.swapcase != char && char.downcase == char
      result += 1
    end
  end

  result
end

def count_uppercase(string)
  result = 0
  string.chars.each do |char|
    if char.swapcase != char && char.upcase == char
      result += 1
    end
  end

  result
end

def letter_percentages(string)
  percentages = { lowercase: 0, uppercase: 0, neither: 100 }
  number_lowercase = count_lowercase(string)
  number_uppercase = count_uppercase(string)
  number_neither = string.size - (number_lowercase + number_uppercase)

  percentages[:lowercase] = (number_lowercase * 100.0) / string.size
  percentages[:uppercase] = (number_uppercase * 100.0) / string.size
  percentages[:neither] = (number_neither * 100.0) / string.size

  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10,
                                        neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5,
                                      neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
