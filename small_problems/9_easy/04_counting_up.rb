def sequence(num)
  sequence_array = []

  1.upto(num) do |index|
    sequence_array << index
  end

  sequence_array
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
