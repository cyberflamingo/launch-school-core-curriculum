def running_total(num_array)
  running_array = num_array.map.with_index do |number, index|
    if index == 0
      number
    else
      number + num_array[0..(index - 1)].sum
    end
  end

  running_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
