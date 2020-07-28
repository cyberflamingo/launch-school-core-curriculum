# frozen_string_literal: true

=begin rdoc

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
1. From the string, create an array of every substring (separation at space)
2. Create another array that will receive our swapped words
3. Iterate over the array of substrings
  1. Copy the substring
  2. Take the first character from the substring and swap it for the last
     in the copy
  3. Take the last character from the substring and swap it for the first
     in the copy
  4. Save the new string in the array created previously
4. Join the substring in the resulting array with a space and return

== Code

=end

def swap(str)
  ary = str.split

  swap_ary = ary.map do |str1|
    str2 = str1.dup

    str2[-1] = str1[0]
    str2[0] = str1[-1]

    str2
  end

  swap_ary.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
