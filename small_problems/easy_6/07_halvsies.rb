def halvsies(list)
  first_half = []
  second_half = []
  halfer = (list.size / 2)
  halfer += 1 if list.size.odd?

  list.each_with_index do |obj, i|
    if i < halfer
      first_half << obj
    else
      second_half << obj
    end
  end

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
