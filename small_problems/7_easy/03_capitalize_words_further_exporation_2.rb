UPPERCASE = (('a'..'z').to_a).zip('A'..'Z').to_h

def word_cap(words)
  chars_array = words.chars.each_with_index do |char, index|
    if UPPERCASE.key(char)
      char[0] = UPPERCASE.key(char)
    end

    if words.chars[index - 1] == ' ' && UPPERCASE[char[0]] || index == 0
      char[0] = UPPERCASE[char[0]]
    end

    char
  end

  chars_array.join('')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
