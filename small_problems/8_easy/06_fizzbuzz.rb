def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    if (num % 3 == 0) && (num % 5 == 0)
      print 'BizzBuzz'
    elsif num % 3 == 0
      print 'Fizz'
    elsif num % 5 == 0
      print 'Buzz'
    else
      print num
    end

    print ', ' unless num == end_num
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
