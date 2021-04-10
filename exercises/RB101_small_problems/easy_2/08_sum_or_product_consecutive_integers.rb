=begin

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. Integer greater than 0
  2. Sum or Product?
* Output:
  1. Sum or Product of all numbers between 1 and the entered integer

---

*Problem Domain:*
Math

---

*Implicit Requirements:*
* Ask only for the first letter of 'sum' or 'product'.

---

*Clarifying Questions:*

---

*Mental Model:*
Sum OR product every integer between 1 and the given number,
and return the result.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 5
    2. s (sum)
  * Output
    1. 15
* Example 2
  * Inputs:
    1. 6
    2. p
  * Output
    1. 720

---

== Data Structure

*Your Data Structure:*
A Hash for the association of 's' and 'p' with 'sum' and 'product'.

---

== Algorithm

*Your Algorith:*
1. Ask for an integer greater than 0
  1. Verify it's greater than 0
  2. If not, loop and re-ask
  3. If it is, continue
2. Ask for s or p
  1. If it's neither, re-ask
  2. Continue
2. Compute every number between 1 and the given integer
  1. Sum if s was selected or
  2. Product if p was selected
3. Return the result in a string

== Code

=end

def prompt(message)
  puts ">> #{message}"
end

def sum_consecutive_integer(num)
  result = 0
  1.upto(num) do |i|
    result += i
  end
  result
end

def product_consecutive_integer(num)
  result = 1
  1.upto(num) do |i|
    result *= i
  end
  result
end

operator = ["sum", "product"]

operator_letter = operator.map do |val|
  val[0]
end

int = 1
loop do
  prompt("Please enter an integer greater than 0:")
  int = gets.to_i

  break if int > 0
end

selected_operator = ''
loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  selected_operator = gets.chomp

  break if operator_letter.include?(selected_operator)
end

if selected_operator == 's'
  result = sum_consecutive_integer(int)
  puts "The sum of the integers between 1 and #{int} is #{result}."
elsif selected_operator == 'p'
  result = product_consecutive_integer(int)
  puts "The product of the integers between 1 and #{int} is #{result}."
else
  puts "I didn't get that"
end
