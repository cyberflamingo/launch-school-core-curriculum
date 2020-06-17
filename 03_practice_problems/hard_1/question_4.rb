def right_component_number?(array)
  array.size == 4
end

def an_ip_number?(word)
  word.to_i >= 0 && word.to_i <= 255
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless right_component_number?(dot_separated_words)

  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    return false unless an_ip_number?(word)
  end

  true
end

# Good IP
puts "10.4.5.11 is an IP address:   #{dot_separated_ip_address?('10.4.5.11')}"
# Bad IP (fewer than 4 components)
puts "4.5.5 is an IP address:       #{dot_separated_ip_address?('4.5.5')}"
# Bad IP (more than 4 components)
puts "1.2.3.4.5 is an IP address:   #{dot_separated_ip_address?('1.2.3.4.5')}"
# Good IP (with 0)
puts "10.4.0.11 is an IP address:   #{dot_separated_ip_address?('10.4.0.11')}"
# Bad IP (Negative number)
puts "10.4.-5.11 is an IP address:  #{dot_separated_ip_address?('10.4.-5.11')}"
# Bad IP (bigger than 255)
puts "10.4.256.11 is an IP address: #{dot_separated_ip_address?('10.4.256.11')}"
