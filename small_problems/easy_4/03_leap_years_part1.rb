# frozen_string_literal: true

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. A year in integer
* Output:
  1. A boolean returning whether the inputed year is a leap year or not

---

*Problem Domain:*
Calendar, algebra

---

*Implicit Requirements:*
Knowing how to calculate leap year in the Gregorian Calendar.

---

*Clarifying Questions:*

1. Negative years? (no)
2. Only integer? (yes)

---

*Mental Model:*
Create a program that take an integer of a year and return whether the year is
leap of not.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 2016
  * Output
    1. true
* Example 2
  * Inputs:
    1. 2015
  * Output
    1. false
* Example 3
  * Inputs:
    1. 2100
  * Output
    1. false
* Example 4
  * Inputs:
    1. 2400
  * Output
    1. true

etc

---

== Data Structure

*Your Data Structure:*
Integers

---

== Algorithm

*Your Algorith:*
1. Return TRUE if year is evenly divisible by 400
2. Check if year is evenly divisible by 100
  1. If TRUE return FALSE
3. Check if year is evenly divisible by 4
  1. If TRUE return TRUE

== Code

=end

def leap_year?(year)
  return true if year % 400 == 0

  if year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
