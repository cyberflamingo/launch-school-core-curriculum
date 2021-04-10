# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. a 1st number
  2. a 2nd number
  3. a 3rd number
  4. a 4th number
  5. a 5th number
  6. a last number
* Output:
  1. Return last number, the list of 5 numbers and whether the last number
     appears in the list

---

*Problem Domain:*
Integer comparison

---

*Implicit Requirements:*
Number must be strings.
We are skipping number validation.

---

*Clarifying Questions:*

1. Can it be 0 or negative? (yes)
2. Can we use float? (no)

---

*Mental Model:*
Ask 5 times for a number and save the value inside an array.
For the last number, check if it appears in the array and return result.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 25
    2. 15
    3. 20
    4. 17
    5. 23
    6. 17
  * Output
    1. 'The number 17 appears in [25, 15, 20, 17, 23].'
* Example 2
  * Inputs:
    1. 25
    2. 15
    3. 20
    4. 17
    5. 23
    6. 18
  * Output
    1. 'The number 18 does not appear in [25, 15, 20, 17, 23].'

---

== Data Structure

*Your Data Structure:*
Array of integers.

---

== Algorithm

*Your Algorith:*
1. Ask for the first number and save it as an integer inside our array.
2. Ditto for 2nd number
3. Ditto for 3rd number
4. Ditto for 4th number
5. Ditto for 5th number
6. Ask for a last number
  1. Convert it to an integer
  2. Check if the integer is present inside the array
  3. Return the result in a string.

== Code

=end

def prompt(string)
  puts "==> #{string}"
end

def ask_for_numbers
  list = []
  prompt("Enter the 1st number:")
  list << gets.to_i
  prompt("Enter the 2nd number:")
  list << gets.to_i
  prompt("Enter the 3rd number:")
  list << gets.to_i
  prompt("Enter the 4th number:")
  list << gets.to_i
  prompt("Enter the 5th number:")
  list << gets.to_i

  list
end

num_list = ask_for_numbers

prompt("Enter the last number:")
last_num = gets.to_i

if num_list.include?(last_num)
  puts "The number #{last_num} appears in #{num_list}."
else
  puts "The number #{last_num} does not appear in #{num_list}."
end
