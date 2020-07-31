# frozen_string_literal: true

=begin rdoc

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

1. Should I return a new array or not? (no)

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
A hash

---

== Algorithm

*Your Algorith:*
1. Create a constant hash of keys 0 to 19 and their equivalent values in English
2. Create a new hash
  1. As key, use each number of the given array
  2. Map each numbers English words as value using the constant hash
3. Sort the new array by its value
4. Return the key as an array

== Code

=end

ALPHA_NUM = { 0 => 'zero',
              1 => 'one',
              2 => 'two',
              3 => 'three',
              4 => 'four',
              5 => 'five',
              6 => 'six',
              7 => 'seven',
              8 => 'eight',
              9 => 'nine',
              10 => 'ten',
              11 => 'eleven',
              12 => 'twelve',
              13 => 'thirteen',
              14 => 'fourteen',
              15 => 'fifteen',
              16 => 'sixteen',
              17 => 'seventeen',
              18 => 'eighteen',
              19 => 'nineteen' }

def alphabetic_number_sort(arr_num)
  hsh_num = {}

  arr_num.each do |v|
    hsh_num[v] = ALPHA_NUM[v]
  end

  hsh_num.sort_by { |_, v| v }.to_h.keys
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
