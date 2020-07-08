def short_long_short(str1, str2)
  longer_str = ""
  shorter_str = ""

  str1.size > str2.size ? longer_str = str1 : longer_str = str2

  longer_str.size == str1.size ? shorter_str = str2 : shorter_str = str1

  shorter_str + longer_str + shorter_str
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
