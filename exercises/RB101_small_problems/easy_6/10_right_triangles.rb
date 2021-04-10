def triangle(n)
  col = 1

  n.times do
    spaces = ' ' * (n - col)
    stars = '*' * col

    puts spaces + stars

    col += 1
  end
end

triangle(5)
# Expected output
#
#     *
#    **
#   ***
#  ****
# *****

triangle(9)
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
