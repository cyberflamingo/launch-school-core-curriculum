alphabet = []
('a'..'z').each { |digit| alphabet << digit }

char = alphabet.sample

p "Random character: #{char}"
p char.ord.chr == char

def string_value(str)
  str_ary = str.split('')
  ascii_ary = []

  str_ary.each do |char|
    ascii_ary << char.ord
  end

  puts "This string '#{str}' use the following ASCII characters:"
  puts ascii_ary.to_s

  new_str_ary = []

  ascii_ary.each do |ascii|
    new_str_ary << ascii.chr
  end

  new_str_ary.join('')
end

p string_value('Four score') == 'Four score'
p string_value('Launch School') == 'Launch School'
p string_value('a') == 'a'
p string_value('') == ''
