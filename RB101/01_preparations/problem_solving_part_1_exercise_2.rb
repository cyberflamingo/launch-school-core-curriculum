# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Input:  integer number (n)
* Output: Diamond made of "*" character, width = n

---

*Problem Domain:*
Mathematic and geometry (diamond)

---

*Implicit Requirements:*
* Only works with odd number? (from examples)
* Non-negative number
* Non-null
* Print vertically

---

*Clarifying Questions:*

1. Only odd number allowed?
2. Shall I print an error if n is even or null?

---

*Mental Model:*
Print a vertical diamond of "*" characters whose width n is the given
positive odd number n.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Input: n = 3
  * Output:
```
 *
***
 *
```
* Example 2
  * Input: n = 5
  * Output:
```
  *
 ***
*****
 ***
  *
```

* Example 3
  * Input: n = 1
  * Output:
```
*
```

* Example 4
  * Input: n = 0
  * Output:
```
Please input a non-null odd number.
```

---

== Data Structure

*Your Data Structure:*
Smply using the given integer should be enough.

---

== Algorithm

*Your Algorith:*
1. Check if the number is a non-null, odd number
  1. If not, print an error
2. Iterate n number of time (i)
  1. Inside each iteration, calculate n2 = (n - (i + 1)) / 2 if i = odd
  2. Print n2 + (i + 1) + n2 with n2 as spaces and (i) as "*"
3. Reverse iterate n - 1
  1. Do same as before

== Code

=end

def diamond_maker(num, ind)
  return unless ind.even?

  ind += 1
  space_num = (num - ind) / 2
  space = ' ' * space_num
  asterisk = '*' * ind
  puts "#{space}#{asterisk}#{space}"
end

def diamond(num)
  return puts "Can't process this number" if num.even?

  num.times do |i|
    diamond_maker(num, i)
  end

  (0...num - 1).reverse_each do |i|
    diamond_maker(num, i)
  end
end

# diamond(3)
# diamond(5)
# diamond(1)
# diamond(0)

(0..10).each do |i|
  diamond(i)
end
