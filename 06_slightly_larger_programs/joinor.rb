def joinor(arr, separator = ', ', last_separator = 'or')
  joined_str = arr.join(separator)
  first_separator_position = joined_str.index(separator)
  last_separator_position = joined_str.rindex(separator)

  if first_separator_position != last_separator_position
    joined_str[last_separator_position + 1] = " #{last_separator} "
  else
    joined_str[last_separator_position] = " #{last_separator}"
  end

  joined_str
end

p joinor([1, 2])                   == "1 or 2"
p joinor([1, 2, 3])                == "1, 2, or 3"
p joinor([1, 2, 3], '; ')          == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   == "1, 2, and 3"
