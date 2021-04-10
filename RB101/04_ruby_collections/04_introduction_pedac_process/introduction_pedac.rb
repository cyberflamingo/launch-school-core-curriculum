# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. A string of zero or more words.
* Output:
  1. Same string with each palindromes uppercased.

---

*Problem Domain:*
English: knowing what is a palindrome.

---

*Implicit Requirements:*
From the examples:
* Do not alter already upcased words
* String can be empty

---

*Clarifying Questions:*

1. Can I assume all inputs are strings?
   Yes
2. Should I consider letter case when deciding whether a word is a palindrome?
   Palindrome words are case sensitive
3. Do I need to return the same string object or an entirely new string?
   Return a new string.

---

*Mental Model:*
Write a method that take a string and return a new string with each of its
palindrome uppercased. Note that upcase should be respected when identifying
palindromes.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 'We will meet at noon'
  * Output
    1. 'We will meet at NOON'
* Example 2
  * Inputs:
    1. 'No palindromes here'
  * Output
    1. 'No palindromes here'
* Example 3
  * Inputs:
    1. ''
  * Output
    1. ''
* Example 4
  * Inputs:
    1. 'I LOVE my mom and dad equally'
  * Output
    1. 'I LOVE my MOM and DAD equally'

---

== Data Structure

*Your Data Structure:*
Array of strings.

---

== Algorithm

*Your Algorith:*
1. Split the string by spaces and save the strings in an array 'array'
2. Map 'array' to a new 'array_with_palindromes' and iterate its value
  1. Check in an 'palindrome?' method is the current value is a palindrome
    1. In the 'palindrome?' method, reverse the string and check its equality
       with the string. Return true or false
  2. If true, return the string uppercased
  3. If false, return the string as is
3. Join the new 'array_with_palindromes' and print it

== Code

=end

def palindrome?(string)
  string == string.reverse
end

def change_me(string)
  array = string.split(' ')

  array_with_palindromes = array.map do |value|
    if palindrome?(value)
      value.upcase
    else
      value
    end
  end

  array_with_palindromes.join(' ')
end

p change_me("We will meet at noon") == "We will meet at NOON"
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
