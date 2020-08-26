def diamond(num)
  stars = 1
  spaces = (num - stars) / 2

  num.times do
    puts ' ' * spaces + ('*' * stars) + (' ' * spaces)
    stars += 2
    spaces = (num - stars) / 2

    break if spaces < 0
  end

  stars = num - 2
  spaces = (num - stars) / 2

  (-num..0).each do
    break if stars < 0

    puts ' ' * spaces + ('*' * stars) + (' ' * spaces)
    stars -= 2
    spaces = (num - stars) / 2
  end
end

diamond(1)
# *

diamond(3)
#  *
# ***
#  *

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
