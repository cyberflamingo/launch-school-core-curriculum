=begin

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. An array of Integers between 0 and 19
* Output:
  1. An array of those Integers sorted based on the English words for each num

---

*Problem Domain:*
Algebra, English (sorting)

---

*Implicit Requirements:*
* Numbers are in Ascending Order.
* English words are all downcase

---

*Clarifying Questions:*

1. Should I return a new array or not? (yes)

---

*Mental Model:*
Take an array of Integers and return it sorted based on the English words for
each numbers.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. (0.19).to_a
  * Output
    1. [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

---

== Data Structure

*Your Data Structure:*
Array

---

== Algorithm

*Your Algorith:*

. Create an array from zero to ninteen (index will be the equivalent digit)
.

1. Create a constant hash of keys 0 to 19 and their equivalent values in English
2. Create a new hash
  1. As key, use each number of the given array
  2. Map each numbers English words as value using the constant hash
3. Sort the new array by its value
4. Return the key as an array

== Code

=end

ALPHABETIC_NUMBERS = %w(zero one two three four five six seven eight nine ten
                        eleven twelve thirteen fourteen fifteen sixteen
                        seventeen eighteen nineteen)

def alphabetic_number_sort(integer_array)
  integer_array.sort_by do |integer|
    ALPHABETIC_NUMBERS.values_at(integer)
  end
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
