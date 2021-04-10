def swap_first_last_characters(a, b)
  a, b = b, a
end

def swap(words)
  # `#map` returns the last line therefore we need to reasign
  # the swapped characters and return word
  result = words.split.map do |word|
    word[0], word[-1] = swap_first_last_characters(word[0], word[-1])
    word
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
