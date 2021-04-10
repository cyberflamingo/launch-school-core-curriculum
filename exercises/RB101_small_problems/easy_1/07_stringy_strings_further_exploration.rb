=begin

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

. Create a new local variable of string object
. Iterate the number of time defined by the given integer
  . If the number is even, mutate the string with 1, otherwise 0
. If the lead is 0, slice the last value and prepend '0'
. Return the string
== Code

=end

def stringy(num, lead = 1)
  binary_string = String.new

  num.times do |index|
    binary_string << if index.even?
                       '1'
                     else
                       '0'
                     end
  end

  if lead.zero?
    binary_string.slice!(-1)
    binary_string.prepend(lead.to_s)
  end

  binary_string
end

puts stringy(6) == '101010'
puts stringy(9, 0) == '010101010'
puts stringy(4, 1) == '1010'
puts stringy(7, 0) == '0101010'
