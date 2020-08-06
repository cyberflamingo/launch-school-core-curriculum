=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. A string of variable length
* Output:
  1. The same string inside a pretty box, possibly on multiple lines

---

*Problem Domain:*
N/A

---

*Implicit Requirements:*
* String can be empty
* String can be more than 80 characters (standard terminal screen space). In
  that case, the string should be formatted on multi lines.
* Preserve the string cases and punctuation

---

*Clarifying Questions:*

1. N/a

---

*Mental Model:*
Create a program that take a string of variable length and print it to your
terminal inside a pretty box. If the string length exceed 80 characters,
print it on multi-lines for better formatting.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 'To boldly go where no one has gone before.'
  * Output
    1.
       +--------------------------------------------+
       |                                            |
       | To boldly go where no one has gone before. |
       |                                            |
       +--------------------------------------------+
  * Example 2
  * Inputs:
    1. ''
  * Output
    1.
       +--+
       |  |
       |  |
       |  |
       +--+

* Example 3
  * Inputs:
    1.
'Space: the final frontier. These are the voyages of the starship Enterprise.
Its five-year mission: to explore strange new worlds. To seek out new life and
new civilizations. To boldly go where no man has gone before!'

* Output
    1.
+------------------------------------------------------------------------------+
|                                                                              |
| Space: the final frontier. These are the voyages of the starship Enterprise. |
| Its five-year mission: to explore strange new worlds. To seek out new life   |
| and new civilizations. To boldly go where no man has gone before!            |
|                                                                              |
+------------------------------------------------------------------------------+

---

== Data Structure

*Your Data Structure:*
An array to keep track of 80 characters lines of strings.

---

== Algorithm

*Your Algorith:*
$MAIN
1. $MULTILINE_ARRAY Save string of 76 characters or less in an array of strings
2. Find the longest string in the array of strings and add 2 to make the box
   length `box_l`
3. Define horizontal_rule
4. Define empty_line
5. Iterate over multiline to get each line of the string

$MULTILINE_ARRAY
1. Split the strings in an array of words
2. Create a line counter `i`
3. Iterate over the array
  1. If the current line (String) is nil, initialize it
  2. If the line + word length is more than 76, increment `i` and initialize
     the new line
  3. Add word and a space to current line
4. Iterate over the `multiline`
5. Batton touch to $UNIFY

$UNIFY
1. Strips trailing spaces for each line of the array
2. Find `longest_line`
3. Add spaces for line which are shorter than `longest_line`
4. Return unified array

== Code

=end

def unify_line_size(multiline_arr)
  multiline_arr.each(&:strip!)

  longest_line = multiline_arr.max do |a, b|
    a.length <=> b.length
  end

  multiline_arr.each do |line|
    diff = longest_line.size - line.size
    line << ' ' * diff
  end

  multiline_arr
end

def create_multiline_array(long_str)
  multiline = ['']
  i = 0

  long_str.split.each do |word|
    if multiline[i].nil?
      multiline[i] = ''
    elsif (multiline[i] + word).length > 76
      i += 1
      multiline[i] = ''
    end
    multiline[i] += word + ' '
  end

  unify_line_size(multiline)
end

def print_in_box(message)
  multiline_message = create_multiline_array(message)

  horizontal_rule = "+#{'-' * (multiline_message[0].size + 2)}+"
  empty_line = "|#{' ' * (multiline_message[0].size + 2)}|"

  puts horizontal_rule
  puts empty_line
  multiline_message.each do |line|
    puts "| #{line} |"
  end
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

print_in_box('Space: the final frontier. These are the voyages of the ' \
             'starship Enterprise. Its five-year mission: to explore ' \
             'strange new worlds. To seek out new life and new ' \
             'civilizations. To boldly go where no man has gone before!')
