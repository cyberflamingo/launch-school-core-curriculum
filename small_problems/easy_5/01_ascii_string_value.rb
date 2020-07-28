def ascii_value(str)
  ascii = 0

  ary = str.split('')
  ary.each do |char|
    ascii += char.ord
  end

  ascii
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
