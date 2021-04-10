=begin

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs: a positive integer.
* Output: the sum of its digits.

---

*Problem Domain:*
Basic algebra

---

*Mental Model:*
Take each digits of the given positive integer and sum them.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs: 23
  * Output: 5

* Example 2
  * Inputs: 496
  * Output: 19

* Example 3
  * Inputs: 123_456_789
  * Output: 45

---

== Data Structure

*Your Data Structure:*
Array

---

== Algorithm

*Your Algorith:*

. Stringify and split the given number
. Re-turn each string into integer in the new array and sum them

== Code

=end

def sum(number)
  number.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
