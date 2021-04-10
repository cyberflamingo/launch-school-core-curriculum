def digit_list(num)
  num.to_s.split('').map(&:to_i)
end

puts digit_list(12_345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                      # => true
puts digit_list(375_290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]              # => true
