def sequence(number)
  number.positive? ? (1..number).to_a : (number..0).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-5) == [-5, -4, -3, -2, -1, 0]
p sequence(-3) == [-3, -2, -1, 0]
p sequence(-1) == [-1, 0]
