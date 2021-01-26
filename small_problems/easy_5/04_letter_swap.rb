=begin

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. String of words of at least one letter, separated by spaces, non-null
* Output:
  1. String where first and last letter of every word are swapped

---

*Problem Domain:*
String manipulation

---

*Implicit Requirements:*
* Case sensitive

---

*Clarifying Questions:*

1. N/A

---

*Mental Model:*
Take a string of one or more words, swap its first and last character and
return the result.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 'Oh what a wonderful day it is'
  * Output
    1. 'hO thaw a londerfuw yad ti si'
* Example 2
  * Inputs:
    1. 'Abcde'
  * Output
    1. 'ebcdA'
* Example 3
  * Inputs:
    1. 'a'
  * Output
    1. 'a'

---

== Data Structure

*Your Data Structure:*
Array of string

---

== Algorithm

*Your Algorith:*

. Split the given string by space
. Iterate over the result with `map` and use parallel assignment in the do..end
block
. Return the result joint with space

== Code

=end

def swap(string)
  split_string = string.split

  split_string.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
