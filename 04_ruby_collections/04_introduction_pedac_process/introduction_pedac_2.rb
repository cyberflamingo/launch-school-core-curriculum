# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. A string of zero or more characters
* Output:
  1. An array of every substrings from the given strings that are palindromes

---

*Problem Domain:*
English: knowing what is a palindrome.

---

*Implicit Requirements:*
From the examples:
* Do not alter already upcased words
* String can be empty
* Can have one or more substrings.
* Returns an array

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
Write a method that finds every substring inside the given string and return
them all as an array. Note that upcase should be respected when identifying
palindromes.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 'supercalifragilisticexpialidocious'
  * Output
    1. ['ili']
* Example 2
  * Inputs:
    1. ['abcddcbA']
  * Output
    1. ['bcddcb', 'cddc', 'dd']
* Example 3
  * Inputs:
    1. ['palindrome']
  * Output
    1. []
* Example 4
  * Inputs:
    1. ''
  * Output
    1. []

---

== Data Structure

*Your Data Structure:*
Array of strings.

---

== Algorithm

*Your Algorith:*
1. Create an empty 'results' array
2. Create a first loop index 0 and iterate over each character of the string
   until string length
  1. In ths first loop, for each iteration create a second loop index 1 that
     iterate over the string from its current character and slice it to index
  2. Check if each slice are palindrom
  3. Save the slice in 'results' if it is, pass otherwise
  4. Increment index by one
3. Increment index by one
4. Return 'results'

== Code

=end

def palindrome?(string)
  # puts "#{string} <=> #{string.reverse}"
  string == string.reverse
end

def palindrome_substrings(string)
  max = string.length - 1
  results = []

  i1 = 0
  while i1 < max

    i2 = 2
    while i2 < string.length
      slice = string.slice(i1, i2)
      results << slice if palindrome?(slice)
      i2 += 1
    end

    i1 += 1
  end

  results
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
