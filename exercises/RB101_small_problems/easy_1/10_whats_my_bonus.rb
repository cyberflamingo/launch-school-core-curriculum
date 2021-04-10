=begin

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs: a positive integer,
          a boolean
* Output: an integer

---

*Problem Domain:*
Math

---

*Mental Model:*
If applicable (true), calculate the bonus (salary / 2) for the given
salary.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs: 2800, true
  * Output: 1400

* Example 2
  * Inputs: 1000, false
  * Output: 0

* Example 3
  * Inputs: 50000, true
  * Output: 25000

---

== Data Structure

*Your Data Structure:*
Integer

---

== Algorithm

*Your Algorith:*

. Return 0 if `eligibility` is false
. Return half of `salary` otherwise

== Code

=end

def calculate_bonus(salary, eligibility)
  return salary / 2 unless eligibility == false

  0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50_000, true) == 25_000
