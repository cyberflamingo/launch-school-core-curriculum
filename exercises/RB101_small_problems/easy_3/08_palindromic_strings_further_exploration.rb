def palindrome?(object)
  object == object.reverse
end

p palindrome?([1, 3, 1]) == true
p palindrome?([1, 2, 3]) == false # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
