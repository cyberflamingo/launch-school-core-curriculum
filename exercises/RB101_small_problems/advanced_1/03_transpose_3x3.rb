def transpose(matrix)
  grid_size = matrix.size
  transposed_matrix = Array.new

  grid_size.times do |outer|
    transposed_matrix[outer] = Array.new(grid_size)

    matrix.each_with_index do |line, inner|
      transposed_matrix[outer][inner] = line[outer]
    end
  end

  transposed_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
