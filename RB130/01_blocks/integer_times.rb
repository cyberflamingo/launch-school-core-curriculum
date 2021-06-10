def times(num)
  index = 0

  until index == num
    yield(index)
    index += 1
  end

  num
end

p(times(5) do |num|
  puts num
end)
