def multiply_all_pairs(list1, list2)
  result = []

  list1.each do |num1|
    list2.each do |num2|
      result << num1 * num2
    end
  end

  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
