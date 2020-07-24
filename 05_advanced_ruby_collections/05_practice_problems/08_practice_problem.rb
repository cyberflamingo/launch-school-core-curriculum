hsh = { first: ['the', 'quick'],
        second: ['brown', 'fox'],
        third: ['jumped'],
        fourth: ['over', 'the', 'lazy', 'dog'] }

VOWELS = 'aeiou'

hsh.each_value do |arr|
  arr.each do |str|
    str.chars.each do |char|
      puts char if VOWELS.include?(char)
    end
  end
end
