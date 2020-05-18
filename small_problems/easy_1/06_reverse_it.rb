# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs: A string containing one or more words of variable size.
* Output: Same string with words of 5+ characters reversed.

---

*Problem Domain:*
Math (count char number)

---

*Implicit Requirements:*
No empty strings.
Uppercase are conserved.
No symbols in the string.

---

*Mental Model:*
Write a method that takes a string of one or more words and reverse
words of 5+ characters.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Input:  'Professional'
  * Output: 'lanoisseforP'
* Example 2
  * Input:  'Walk around the block'
  * Output: 'Walk dnuora the kcolb'
* Example 3
  * Input:  'Launch School'
  * Output: 'hcnuaL loohcS'

---

== Data Structure

*Your Data Structure:*
Array

---

== Algorithm

*Your Algorith:*
1. Split the string by spaces and create an array of every word.
2. Iterate over the array and print each word.
  1. Reverse words that are 5+ chars.

== Code

=end

def reverse_words(str)
  str_ary = str.split(' ')
  str_ary.map! do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  str_ary.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
