# frozen_string_literal: false

vehicles      = %w[car car truck car SUV truck
                   motorcycle motorcycle car truck suv]
animals       = ['flamingo', 'red pand']
color         = %w[red RED red]
no_string     = []
empty_string  = ['']
empty_strings = ['', '']

def count_occurrences(ary)
  puts '--'
  return puts 'This array is empty!' if ary.empty?

  count = {}
  ary.each do |str|
    str.downcase!
    if count[str]
      count[str] += 1
    else
      count[str] = 1
    end
  end
  count.each do |key, value|
    puts "#{key} => #{value}"
  end
end

count_occurrences(vehicles)
count_occurrences(animals)
count_occurrences(color)
count_occurrences(no_string)
count_occurrences(empty_string)
count_occurrences(empty_strings)
