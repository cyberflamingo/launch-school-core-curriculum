def create_extremity_pattern(grid_size)
  stars        = grid_size / 2
  outer_spaces = (grid_size - stars) / 2
  stars        = '*' * stars
  outer_spaces = ' ' * outer_spaces

  puts outer_spaces + stars + outer_spaces
end

def create_middle_pattern(grid_size)
  inner_spaces = ' ' * (grid_size - 2)

  puts '*' + inner_spaces + '*'
end

def create_descending_pattern(current_line, grid_size, middle)
  # Line 5:
  # 7 - 4 = 3
  # 5 - 4 = 1
  ## outer_spaces = 0
  ## inner_spaces = 5
  # Line 6:
  # 7 - 4 = 3
  # 6 - 4 = 2
  ## outer_spaces = 1
  ## inner_spaces = 3

  outer_spaces = current_line - middle - 1
  inner_spaces = grid_size - (outer_spaces * 2) - 2
  outer_spaces = ' ' * outer_spaces
  inner_spaces = ' ' * inner_spaces

  puts outer_spaces + '*' + inner_spaces + '*' + outer_spaces
end

def create_ascending_pattern(current_line, grid_size, middle)
  outer_spaces = (middle - current_line) / 2
  inner_spaces = grid_size - (outer_spaces * 2) - 2
  outer_spaces = ' ' * outer_spaces
  inner_spaces = ' ' * inner_spaces

  puts outer_spaces + '*' + inner_spaces + '*' + outer_spaces
end

def star(grid_size)
  middle = (grid_size / 2) + 1
  grid_size.times do |line|
    line += 1
    if line == 1 || line == grid_size
      create_extremity_pattern(grid_size)
    elsif line == middle
      create_middle_pattern(grid_size)
    elsif line < middle
      create_ascending_pattern(line, grid_size, middle)
    else
      create_descending_pattern(line, grid_size, middle)
    end
  end
end

star(3)
#  *
# * *
#  *

star(4)
#  **
# *  *
# *  *
#  **

star(7)
#   ***
#  *   *
# *     *
# *     *
# *     *
#  *   *
#   ***

# Current algorithm does not work after 7
