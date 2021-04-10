def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  number_of_spaces = 0
  number_of_spaces = number_of_stars - 2 unless number_of_stars < 2
  if number_of_spaces == 0
    stars = '*'
  else
    stars = '*' + (' ' * number_of_spaces) + '*'
  end
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(1)
# *

diamond(3)
#  *
# * *
#  *

diamond(5)
#   *
#  * *
# *   *
#  * *
#   *

diamond(9)
#     *
#    * *
#   *   *
#  *     *
# *       *
#  *     *
#   *   *
#    * *
#     *
