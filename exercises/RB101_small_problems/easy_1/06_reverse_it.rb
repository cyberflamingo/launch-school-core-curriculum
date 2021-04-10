=begin

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

. Split the given sentence by spaces and initialize new local variable `words`
. Iterate over `words` with `map` passing in a `do..end` block and save the
result to local variable `reversed_words`
  . Reverse letters if the string's length is +5
  . Return string as is otherwise
. Join `reversed_words` with spaces

== Code

=end

def reverse_words(sentence)
  words = sentence.split
  reversed_words = words.map do |word|
    if word.length >= 5
      word.split('').reverse.join
    else
      word
    end
  end

  reversed_words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
