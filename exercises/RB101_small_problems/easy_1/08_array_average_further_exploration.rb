=begin

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

. Sum all integers of the given array
. Dvide by the length of the given array
. Return the result

== Code

=end

def average(numbers)
  sum = 0.0

  numbers.each do |num|
    sum += num
  end

  sum / numbers.length
end

puts average([1, 6]) == 3.5 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25.666666666666668
puts average([9, 47, 23, 95, 16, 52]) == 40.333333333333336
