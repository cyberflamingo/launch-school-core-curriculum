def fibonacci(n)
  result = []

  (0..n).each do |index|
    if index == 0
      result << 0
    elsif index == 1
      result << 1
    else
      result << result[index - 1] + result[index - 2]
    end
  end

  result.last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
