def double(num)
  string_num = num.to_s
  center = string_num.size / 2

  string_num.size.even? == true &&
    string_num[0..(center - 1)] == string_num[center..-1]
end

def twice(integer)
  double(integer) ? integer : integer * 2
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
