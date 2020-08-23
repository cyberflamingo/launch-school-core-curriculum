VOWELS = %w(a e i o u)
CONSONANT = ('a'..'z').to_a - VOWELS

def double_consonants(str)
  repeated_str = ''

  str.chars.each do |char|
    if CONSONANT.include?(char.downcase)
      repeated_str << char << char
    else
      repeated_str << char
    end
  end

  repeated_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
