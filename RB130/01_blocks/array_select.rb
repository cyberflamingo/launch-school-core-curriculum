def select(array)
  selected = []
  index = 0

  while index < array.size
    if yield(array[index])
      selected << array[index]
    end

    index += 1
  end

  selected
end

array = [1, 2, 3, 4, 5]

p(select(array, &:odd?))
p(select(array) { |num| puts num })
p(select(array) { |num| num + 1 })
