# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs: An array of numbers
* Output: The average of all numbers of the array

---

*Problem Domain:*
Math (average)

---

*Mental Model:*
Return the average (integer) of all number of a given array.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs: [1, 5, 87, 45, 8, 8]
  * Output: 25

* Example 2
  * Inputs: [9, 47, 23, 95, 16, 52]
  * Output: 40

---

== Data Structure

*Your Data Structure:*
Array

---

== Algorithm

*Your Algorith:*
1. Create a new integer sum
2. Iterate over the given array.
  1. Sum each number
3. Divise the sum by the length of the array
4. Return result

== Code

=end

def average(ary)
  sum = 0

  ary.each do |num|
    sum += num
  end

  sum / ary.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
