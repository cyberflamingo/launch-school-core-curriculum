ALPHABET = ('a'..'z').to_a

def cleanup(str)
  cleanup_str = str.split('').map do |char|
    if ALPHABET.include?(char)
      char
    else
      ' '
    end
  end

  cleanup_str.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
