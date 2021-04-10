def swap_name(string)
  words = string.split

  "#{words[1]}, #{words[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
