# frozen_string_literal: true

=begin rdoc

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
1. Make an array containing each digits of the given integer
2. Return the sum  of them all

== Code

=end

def sum(num)
  digits = num.to_s.split('')

  digits.reduce { |sum, n| sum.to_i + n.to_i }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
