def print_in_box(str)
  str_l = str.length
  box_l = str_l + 2

  box_top    = '+' + ('-' * box_l) + '+'
  box_middle = '|' + (' ' * box_l) + '|'
  box_text   = '| ' + str + ' |'
  box_bottom = box_top

  puts box_top
  puts box_middle
  puts box_text
  puts box_middle
  puts box_bottom
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
