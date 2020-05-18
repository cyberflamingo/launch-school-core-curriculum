# frozen_string_literal: false

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs: an integer and an optional argument defaulting to 1
* Output: a string of alternating 1s and 0s the length of the given
integer. The string starts with 0 if the optional argument is set to 0,
1 otherwise.

---

*Problem Domain:*
Math

---

*Implicit Requirements:*
N/A

---

*Mental Model:*
Stransform an integer into a string of series of 1s and 0s of the length of
the integer. Alternate between 0 and 1, or 1 and 0 depending on the
optional argument.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs: 6
  * Output: '101010'

* Example 2
  * Inputs: 9, 0
  * Output: '010101010'

* Example 3
  * Inputs: 4m 1
  * Output: '1010'

* Example 4
  * Inputs: 7, 0
  * Output: '0101010'

---

== Data Structure

*Your Data Structure:*
Array

---

== Algorithm

*Your Algorith:*
1. Create a new array
2. Iterate the number of time defined by the given integer.
  1. If the number is even, push 1, otherwise 0
3. If the optional argument is set to 0, pop the last
value in the array and prepend 0.

== Code

=end

def stringy(size, lead = 1)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  if lead.zero?
    numbers.pop
    numbers.prepend(lead)
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9, 0) == '010101010'
puts stringy(4, 1) == '1010'
puts stringy(7, 0) == '0101010'
