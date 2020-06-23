def multiply(num1, num2)
  num1 * num2
end

def power_to(num, power)
  if num == 0
    1
  elsif num > 0
    multiply(num, 1)**power
  else
    1 / multiply(num, 1)**power
  end
end

puts power_to(3, 2) == 9
puts power_to(5, 0) == 1
puts power_to(2, 2) == 4
puts power_to(6, -2).to_s == "1/36"
