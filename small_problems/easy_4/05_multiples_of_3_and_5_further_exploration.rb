# Try to use Enumerable.inject or reduce

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  multisum = (1..max_value).inject(0) do |sum, number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum + number
    else
      sum
    end
  end

  multisum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
