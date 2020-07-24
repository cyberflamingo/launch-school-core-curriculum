arr = ['10', '11', '9', '7', '8']

ordered_arr = arr.sort do |num1, num2|
  num2.to_i <=> num1.to_i
end

p ordered_arr
