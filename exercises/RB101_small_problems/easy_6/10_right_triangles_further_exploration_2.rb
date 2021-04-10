def starting_direction(dir)
  spaces = n - 1
  stars = 1
  if dir.start_with?('top')
    spaces = 0
    stars = n
  end

  return spaces, stars
end

def triangle(n, dir)
  spaces, stars = starting_direction(dir)

  n.times do
    if dir.end_with?('left')
      puts ('*' * stars) + (' ' * spaces)
    else
      puts (' ' * spaces) + ('*' * stars)
    end

    if dir.start_with?('top')
      spaces += 1
      stars -= 1
    else
      spaces -= 1
      stars += 1
    end
  end
end

triangle(5, 'top-left')
# Expected output
#
# *****
# ****
# ***
# **
# *

triangle(6, 'top-right')
# Expected output
#
# ******
#  *****
#   ****
#    ***
#     **
#      *

triangle(7, 'bottom-left')
# Expected output
#
# *
# **
# ***
# ****
# *****
# ******
# *******

triangle(9, 'bottom-right')
# Expected output
#
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
