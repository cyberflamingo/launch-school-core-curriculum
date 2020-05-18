# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs: An array of case-sensitive words.
* Output: Each words alongside its number of occurrences.

---

*Problem Domain:*
Algebra (counting)

---

*Implicit Requirements:*
* Array of strings
* Needs at list one word (print error otherwise)
* Print order is irrelevent

---

*Mental Model:*
Print a list of each words in the given array, alongside their number of
occurences.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
  vehicles = [ 'car', 'car', 'truck', 'car', 'SUV', 'truck',
               'motorcycle', 'motorcycle', 'car', 'truck' ]
  * Output
```
car => 4
truck => 3
SUV => 1
motorcycle => 2
```

* Example 2
  * Inputs:
  animals = [ 'flamingo', 'red panda' ]
  * Output
```
flamingo => 1
red panda => 1
```

* Example 3
  * Inputs:
  color = [ 'red', 'red', 'red' ]
  * Output
```
red => 3
```

* Example 4
  * Inputs:
  no_string = []
  * Output
```
This array is empty
```

* Example 5
  * Input:
  empty_string = [ '' ]
  * Ouput:
```
 => 1
```

* Example 5
  * Input:
  empty_strings = [ '', '' ]
  * Ouput:
```
 => 2
```

---

== Data Structure

*Your Data Structure:*
Using a hash alongside the given array.

---

== Algorithm

*Your Algorith:*
1. Iterate over the given array.
  1. If the word is not in our hash, add it with a count of one, otherwise
  increase its count.
2. Print each index/value pair of the hash, formated for the expected output.

== Code

=end

vehicles      = %w[car CAR truck car SUV truck
                   motorcycle motorcycle car truck]
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
