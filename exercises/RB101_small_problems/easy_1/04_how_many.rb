=begin

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
* Needs at least one word (print error otherwise)
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

. Create a `count` hash
. Iterate over the given array
  . Add the string and increment its count to 1 if it is not part of count
  . Increment the string count if its already present
. Define a new `print_occurences` method taking one parameter
. Print the key/value pair of the hash, formated with the expected utput

== Code

=end
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
            'motorcycle', 'motorcycle', 'car', 'truck']
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
