def create_descending_pattern(line, size)
  outer_spaces = size - line
  inner_spaces = (size - 3 - (outer_spaces * 2)) / 2
  outer_spaces = ' ' * outer_spaces
  inner_spaces = ' ' * inner_spaces

  puts outer_spaces + '*' + inner_spaces + '*' + inner_spaces + '*' + \
       outer_spaces
end

def create_ascending_pattern(line, size)
  outer_spaces = line - 1
  inner_spaces = (size - 3 - (outer_spaces * 2)) / 2
  outer_spaces = ' ' * outer_spaces
  inner_spaces = ' ' * inner_spaces

  puts outer_spaces + '*' + inner_spaces + '*' + inner_spaces + '*' + \
       outer_spaces
end

def star(num)
  middle = num / 2
  num.times do |line|
    line += 1
    if line == middle + 1
      puts '*' * num
    elsif line <= middle
      create_ascending_pattern(line, num)
    else
      create_descending_pattern(line, num)
    end
  end
end

star(7)
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

star(9)
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
