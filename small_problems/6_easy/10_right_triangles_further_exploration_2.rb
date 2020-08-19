require 'pry'

def triangle(n, dir)
  if dir.start_with?('top')
    spaces = 0
    stars = n
  else
    spaces = n - 1
    stars = 1
  end

  n.times do
    if dir.end_with?('left')
      puts ('*' * stars) + (' ' * spaces)
    else
      puts (' ' * spaces) + ('*' * stars)
    end
    # binding.pry

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
