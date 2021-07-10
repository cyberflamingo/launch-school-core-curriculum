list = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(list) { |items| items.join(', ') }

puts '-' * 80

gather(list) do |produce|
  "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end
