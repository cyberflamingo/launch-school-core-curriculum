def fibonacci_last(nth)
  last2 = [1, 1]

  # The last digits of Fibonacci numbers follows a pattern that repeats every
  # 60th times. `nth` modulo 60 should therefore do the trick.
  3.upto(nth % 60) do
    last2 = [last2.last, (last2.first + last2.last) % 10]
  end

  last2.last
end

p fibonacci_last(1)         # -> 1
p fibonacci_last(2)         # -> 1
p fibonacci_last(3)         # -> 2
p fibonacci_last(4)         # -> 3
p fibonacci_last(5)         # -> 5
p fibonacci_last(12)        # -> 4
p fibonacci_last(15)        # -> 0 (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is
                            #       354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
