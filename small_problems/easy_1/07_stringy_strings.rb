# frozen_string_literal: false

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs: an integer
* Output: a string of alternating 1s and 0s, starting with 1, the length of the
given integer.

---

*Problem Domain:*
Math

---

*Implicit Requirements:*
N/A

---

*Mental Model:*
Stransform an integer into a string of series of 1s and 0s of the length of
integer.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs: 6
  * Output: '101010'

* Example 2
  * Inputs: 9
  * Output: '101010101'

* Example 3
  * Inputs: 4
  * Output: '1010'

* Example 4
  * Inputs: 7
  * Output: '1010101'

---

== Data Structure

*Your Data Structure:*
String

---

== Algorithm

*Your Algorith:*
1. Create a new string
2. Iterate the number of time defined by the given integer.
  1. If the number is even, mutate the string with 1, otherwise 0
3. Return the string

== Code

=end

def stringy(num)
  stringy = ''

  num.times do |i|
    stringy << if i.even?
                 '1'
               else
                 '0'
               end
  end
  stringy
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
