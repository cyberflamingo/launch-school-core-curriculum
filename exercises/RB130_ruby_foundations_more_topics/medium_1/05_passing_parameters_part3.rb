items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*line1, line2|
  puts line1.join(', ')
  puts line2
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

puts '-' * 80

gather(items) do |line1, *line2, line3|
  puts line1
  puts line2.join(', ')
  puts line3
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

puts '-' * 80

gather(items) do |line1, *line2|
  puts line1
  puts line2.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

puts '-' * 80

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage} and #{wheat}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
