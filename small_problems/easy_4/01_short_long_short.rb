def short_long_short(string1, string2)
  strings_array = Array.new
  strings_array.push(string1, string2).sort_by!(&:length)

  strings_array << strings_array[0]
  strings_array.join
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
