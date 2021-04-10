def bubble_sort!(list)
  list_size = list.size

  loop do
    tail = 0
    i = 1

    while i < list_size
      if list[i - 1] > list[i]
        list[i - 1], list[i] = list[i], list[i - 1]
        tail = i
      end
      i += 1
    end

    list_size = tail
    break if list_size <= 1
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
