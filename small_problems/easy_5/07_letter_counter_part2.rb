ALPHABET = ('A'..'z').to_a

def cleanup(str)
  cleanup_str = str.split('').map do |char|
    if ALPHABET.include?(char) || char == ' '
      char
    else
      ''
    end
  end

  cleanup_str.join.squeeze(' ')
end

def word_sizes(str)
  hsh = {}
  alpha_only = cleanup(str)

  alpha_only.split.each do |word|
    l = word.length

    if hsh.key?(l)
      hsh[l] += 1
    else
      hsh[l] = 1
    end
  end

  hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
