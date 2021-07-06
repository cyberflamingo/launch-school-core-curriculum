def each_with_index(collection)
  index = 0
  collection.each do |element|
    yield(element, index)
    index += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
