def create_descending_pattern(line, size)
  stars  = '*' * (((size - line) * 2) + 1)
  spaces = ' ' * ((size - stars.length) / 2)

  puts spaces + stars + spaces
end

def create_ascending_pattern(line, size)
  stars  = '*' * ((line * 2) - 1)
  spaces = ' ' * ((size - stars.length) / 2)

  puts spaces + stars + spaces
end

def diamond(num)
  num.times do |line|
    line += 1
    if line <= (num / 2)
      create_ascending_pattern(line, num)
    else
      create_descending_pattern(line, num)
    end
  end
end

diamond(1)
# *

diamond(3)
#  *
# ***
#  *

diamond(5)
#   *
#  ***
# *****
#  ***
#   *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
