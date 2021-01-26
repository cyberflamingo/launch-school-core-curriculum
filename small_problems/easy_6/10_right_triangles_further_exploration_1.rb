def triangle(n)
  col = 0

  n.times do
    spaces = ' ' * col
    stars = '*' * (n - col)

    puts spaces + stars

    col += 1
  end
end

triangle(5)
# Expected output
#
# *****
#  ****
#   ***
#    **
#     *

triangle(9)
# Expected output
#
# *********
#  ********
#   *******
#    ******
#     *****
#      ****
#       ***
#        **
#         *
