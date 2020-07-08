def running_total(num_array)
  running_array = []

  num_array.each_with_index do |num, i|
    running_array << num + running_array.fetch(i - 1, 0)
  end

  running_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
