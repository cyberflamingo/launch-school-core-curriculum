def repeater(str)
  repeated_str = ''

  str.chars.each do |char|
    repeated_str << char << char
  end

  repeated_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
