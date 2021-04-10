def spin_me_str(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

str = 'hello world'
puts str.object_id
puts spin_me_str(str).object_id

def spin_me_arr(arr)
  arr.each do |word|
    word.reverse!
  end
end

arr = ['hello', 'world']
puts arr.object_id
puts spin_me_arr(arr).object_id
