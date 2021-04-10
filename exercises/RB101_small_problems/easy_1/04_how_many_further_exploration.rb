vehicles = ['car', 'car', 'truck', 'CAR', 'SUV', 'truck',
            'motorcycle', 'motorcycle', 'car', 'truck', 'suv']
animals = ['flamingo', 'red pand']
color = %w[red RED red]
no_string = []
empty_string = ['']
empty_strings = ['', '']

def print_occurences(hash)
  hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

def count_occurrences(list)
  return puts('List empty!') if list.empty?

  count = Hash.new

  list.each do |word|
    word.downcase!

    if count[word].nil?
      count[word] = 1
    else
      count[word] += 1
    end
  end

  print_occurences(count)
end

count_occurrences(vehicles)
count_occurrences(animals)
count_occurrences(color)
count_occurrences(no_string)
count_occurrences(empty_string)
count_occurrences(empty_strings)
