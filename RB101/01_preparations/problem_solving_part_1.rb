=begin rdoc

= PEDAC Template

== (Understand the) Problem

* Inputs: String with one or more words separated by spaces, terminates by 0 or
          more spaces and one point.
* Output: Successive words separated by one space. Last word terminated by one
          point instead of a space. Also, odd words are reversed.

---

*Problem Domain:*

No specific domain for this exercise except English language.

---

*Implicit Requirements:*

From the given example, capital letter and symbols other than dotes are not
considered.

---

*Clarifying Questions:*

1. N/A

---

*Mental Model:*

After discarding the last point, make an ordered lists of strings from the
given input, minus the spaces. Create a new string from every words from the
list separated by one space, except for the last word which will be followed by
a point. Print the result.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Input:  "whats the matter with kansas."
  * Output: "whats eht matter htiw kansas."
* Example 2
  * Input:  "i like  flamingoes  ."
  * Output: "i ekil flamingoes."
* Example 3
  * Input:  "capybara ."
  * Output: "capybara."
* Example 4
  * Input:  " red pandas are cute."
  * Output: "red sadnap are etuc."
* Example 5
  * Input:  "   a   ."
  * Output: "a."

---

== Data Structure

We are going to use an array to save our list of words.

---

== Algorithm

1. From the inputed string, delete the final dot and make an array of strings
   without spaces.
2. Create a new array, reversing each odd words.
3. Reconstruct the string using this new array, spacing each word with one
   space character.
4. Add a final point to this string.
5. Print the string.

== Code

=end

def weirdify(str)
  str.delete_suffix!('.')
  ary = str.split

  weird_ary = ary.collect.with_index do |v, i|
    if i.odd?
      v.reverse
    else
      v
    end
  end

  weird_str = weird_ary.join(' ')
  weird_str << '.'
end

puts weirdify('whats the matter with kansas.')
puts weirdify('i like  flamingoes  .')
puts weirdify('capybara.')
puts weirdify(' red pandas are cute.')
puts weirdify('   a   .')
puts weirdify('')
