ALPHABET = ('a'..'z').to_a

def decypher
  file = '05_encrypted_pioneers_rot13.txt'
  result = ''

  File.readlines(file).each do |line|
    result << decrypt_rot13(line)
  end

  result
end

def decrypt_rot13(string)
  decrypted_string = ''

  string.split('').each do |letter|
    if ALPHABET.include?(letter.downcase)
      letter_position = ALPHABET.index(letter.downcase) - 13
      decrypted_string << ALPHABET[letter_position]
    else
      decrypted_string << letter
    end
  end

  decrypted_string.gsub(/\w+/, &:capitalize)
end

puts decypher
