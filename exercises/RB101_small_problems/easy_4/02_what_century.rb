=begin

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. A year (integer)
* Output:
  1. The century of the given year (string)

---

*Problem Domain:*
Calendar problem. A bit of English.

---

*Implicit Requirements:*
Can be more than the current year.
Seems positive year only.

---

*Clarifying Questions:*

1. Negative year? (No)
2. Integer only? (Yes)

---

*Mental Model:*
Take a number and return it's associated century as a string, formated with the
correct English notation ('st', 'nd', 'rd' or 'th')

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 2000
  * Output
    1. '20th'
* Example 2
  * Inputs:
    1. 2001
  * Output
    1. '21st'
* Example 3
  * Inputs:
    1. 1965
  * Output
    1. '20th'
* Example 4
  * Inputs:
    1. 256
  * Output
    1. '3rd'
* Example 5
  * Inputs:
    1. 5
  * Output
    1. '1st'
* Example 6
  * Inputs:
    1. 10103
  * Output
    1. '102nd'
* Example 7
  * Inputs:
    1. 1052
  * Output
    1. '11th'
* Example 8
  * Inputs:
    1. 1127
  * Output
    1. '12th'
* Example 9
  * Inputs:
    1. 11201
  * Output
    1. '113th'

---

== Data Structure

*Your Data Structure:*
Integer

---

== Algorithm

*Your Algorith:*
MAIN:
1. Create a new variable `century_num = 0`
2. Divise the given number by 100
3. Check the last number of the given number
  1. If it's 0, continue
  2. If it's something else, add 1
4. Save the result in `century_num`
5. Pass the result in the `suffix(century)` method
6. Return the result

SUFFIX METHOD:
1. Create a `suffix = ''` method
2. Pass the given `year` in a case statement
  1. `year` ends with 1: `st`
  2. `year` ends with 2: `nd`
  3. `year` is 3: `rd`
  4. Else: `th`
3. Return `year` + `suffix` as a string

== Code

=end

def add_suffix(century)
  ones = century % 10
  tens = (century / 10) % 10

  if tens == 1
    suffix = 'th'
  else
    suffix = case ones
             when 1 then 'st'
             when 2 then 'nd'
             when 3 then 'rd'
             else        'th'
             end
  end

  century.to_s + suffix
end

def century(year)
  century_num = year / 100
  century_num += 1 unless year.to_s.end_with?('0')

  century = add_suffix(century_num)

  century
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
