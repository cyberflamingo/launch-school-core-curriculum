str = "joe's favorite color is blue"
arr = str.split

arr.each do |val|
  val[0] = val[0].upcase!
end

puts arr.join(' ')
