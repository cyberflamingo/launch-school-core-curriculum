def double(num)
  string_num = num.to_s
  index = string_num.length
  return false if index.odd?
  half_index = index / 2

  string_num[0, half_index] == string_num[half_index, half_index]
end

def twice(integer)
  return integer * 2 unless double(integer)
  integer
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
