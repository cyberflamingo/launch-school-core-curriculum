def crunch(str)
  crunched_str = []

  str.each_char do |char|
    crunched_str << char unless crunched_str.last == char
  end

  crunched_str.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
