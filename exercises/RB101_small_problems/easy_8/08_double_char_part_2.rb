VOWELS = %w(a e i o u)
CONSONANT = ('a'..'z').to_a - VOWELS

def double_consonants(str)
  str.chars.map do |char|
    if CONSONANT.include?(char.downcase)
      char + char
    else
      char
    end
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
