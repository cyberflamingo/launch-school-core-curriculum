ALPHABET = ('a'..'z').to_a

def mystery_method
  char = ALPHABET.sample
  puts ">> Random character: #{char}"
  puts "`char.ord.chr == char`: #{char.ord.chr == char}"
end

def string_value(str)
  ascii_ary = str.chars.map(&:ord)

  puts ">> This string '#{str}' use the following ASCII characters:"
  puts ascii_ary.to_s

  ascii_ary.map(&:chr).join
end

3.times do
  mystery_method
end

p string_value('Four score') == 'Four score'
p string_value('Launch School') == 'Launch School'
p string_value('a') == 'a'
p string_value('') == ''
p string_value('What happens if you try this with a longer string instead ' \
               'of a single character?') == 'What happens if you try this ' \
               'with a longer string instead of a single character?'
