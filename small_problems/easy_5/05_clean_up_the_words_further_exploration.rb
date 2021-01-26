ALPHABET = ('a'..'z').to_a

def cleanup(str)
  cleanup_str = str.split('').map do |char|
    if ALPHABET.include?(char.downcase)
      char
    else
      ' '
    end
  end

  cleanup_str.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("---what's My +*& line?") == ' what s My line '
