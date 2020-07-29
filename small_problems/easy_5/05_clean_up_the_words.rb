def cleanup(str)
  str.gsub(/[^a-z]/, ' ').gsub(/[\s]+/, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
