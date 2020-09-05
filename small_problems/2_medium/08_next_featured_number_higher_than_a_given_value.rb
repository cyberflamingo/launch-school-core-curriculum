def featured(num)
  if num >= 9_876_543_210
    return 'There is no possible number that fulfills those requirements.'
  end

  loop do
    num += 1
    # Must be an odd number
    next if num.even?
    # Must be multiple of 7
    next if num % 7 != 0
    # Digits must occur only once each
    num_arr = num.to_s.chars
    next if num_arr.uniq != num_arr
    break
  end

  num
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those
                          #    requirements
