# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. An integer greater than 1
* Output:
  1. The sum of all multiples of 3 or 5 between 1 and the given number

---

*Problem Domain:*
Algebra

---

*Implicit Requirements:*
Number positive, supperior to 0

---

*Clarifying Questions:*

1. For same multiples between 3 and 5, should I count one or two times? (One)

---

*Mental Model:*
Take a number and finds its multiple of 3 and 5. Return the sum of them.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 3
  * Output
    1. 3
* Example 2
  * Inputs:
    1. 5
  * Output
    1. 8
* Example 3
  * Inputs:
    1. 10
  * Output
    1. 33
* Example 4
  * Inputs:
    1. 1000
  * Output
    1. 234168

---

== Data Structure

*Your Data Structure:*
Array of multiples of 3 and 5

---

== Algorithm

*Your Algorith:*
1. Initialize `multiples = []`
2. Iterate over the given number from 1 to itself
3. For each iteration, check if there is multiples of 3 or 5
  1. If yes, Add them to `multiples`
  2. If no, continue to next iteration
4. Check for doublons in `multiples` and get rid of it
5. Sum every multiple in multiples
6. Return the result

== Code

=end

def multisum(num)
  multiples = []

  (1..num).each do |digit|
    multiples << digit if digit % 3 == 0 || digit % 5 == 0
  end

  # Actually usesless
  # multiples.uniq!

  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
