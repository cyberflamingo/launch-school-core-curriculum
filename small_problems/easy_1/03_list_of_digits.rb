# frozen_string_literal: true

def digit_list(int)
  num_ary = int.to_s.split('')

  num_ary.map! do |num|
    num.to_i
  end
end

puts digit_list(12_345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                      # => true
puts digit_list(375_290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]              # => true
