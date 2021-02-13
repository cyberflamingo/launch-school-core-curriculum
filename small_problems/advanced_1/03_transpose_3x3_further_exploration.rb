def transpose!(matrix)
  grid_size = matrix.size

  grid_size.times do |out|
    out.times do |inn|
      matrix[out][inn], matrix[inn][out] = matrix[inn][out], matrix[out][inn]
    end
  end

  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
