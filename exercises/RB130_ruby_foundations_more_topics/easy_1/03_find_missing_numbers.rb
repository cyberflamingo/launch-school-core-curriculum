def missing(array)
  array.sort!
  missing_num = []

  array.first.upto(array.last) do |num|
    missing_num << num unless array.include?(num)
  end

  missing_num
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
