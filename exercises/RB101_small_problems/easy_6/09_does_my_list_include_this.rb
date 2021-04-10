def include?(list, val)
  checker = {}
  list.each_with_index do |obj, i|
    checker[i] = obj
  end

  checker.value?(val)
end

p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
