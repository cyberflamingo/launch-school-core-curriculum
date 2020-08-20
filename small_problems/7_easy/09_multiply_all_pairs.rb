def multiply_all_pairs(list_1, list_2)
  result = []

  list_1.each do |num_1|
    list_2.each do |num_2|
      result << num_1 * num_2
    end
  end

  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
