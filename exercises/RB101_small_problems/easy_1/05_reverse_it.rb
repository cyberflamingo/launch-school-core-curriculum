=begin

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs: a string with zero or multiple words.
* Output: same string with words reversed.

---

*Problem Domain:*
English?

---

*Implicit Requirements:*
Must works with empty strings.
Uppercase is not a requirement.
No symbols in the string.

---

*Mental Model:*
Write a method that takes a string of zero and more words and reverse the
order of the words.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Input:  ''
  * Output: ''
* Example 2
  * Input:  'Hello World'
  * Output: 'World Hello'
* Example 3
  * Input:  'Reverse these words'
  * Output: 'words these Reverse'

---

== Data Structure

*Your Data Structure:*
Array

---

== Algorithm

*Your Algorith:*

. Split the given string by spaces and reverse the resulting array
. Join the new array by spaces and return

== Code

=end

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
