def cleanup(str)
  str.gsub(/[^a-z]/i, ' ').gsub(/[\s]+/, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("---what's My +*& line?") == ' what s My line '
