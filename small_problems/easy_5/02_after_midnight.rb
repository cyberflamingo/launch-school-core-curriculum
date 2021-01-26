=begin

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. An postive or negative integer
* Output:
  1. The time of day in 24 hour format using the minute-based format

---

*Problem Domain:*
Algebra, time

---

*Implicit Requirements:*
Should return a string.
Should work with any integer.

---

*Clarifying Questions:*

1. N/A

---

*Mental Model:*
Starting from "00:00", return the time minus/plus the number of minutes given
by the integer.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. 0
  * Output
    1. "00:00"
* Example 2
  * Inputs:
    1. -3
  * Output
    1. "23:35"
* Example 3
  * Inputs:
    1. 35
  * Output
    1. "00:35"
* Example 4
  * Inputs:
    1. -1437
  * Output
    1. "00:03"

---

== Data Structure

*Your Data Structure:*
No data structure (only integer)

---

== Algorithm

*Your Algorith:*

. Initialize constant MIN_PER_DAY to 60 * 24
. Initialize constant MIN_PER_HOUR to 60 * 1
. Use `divmod` on the given number to get the number of day and the number of
minutes
  . Discard number of day and save number of minutes to `time_in_min`
. Use `divmod` on `time_in_min`, save in local variable `hours` and `minutes`
. Return concatenated string `hours` ":" `minutes`

== Code

=end

MIN_PER_HOUR = 60
MIN_PER_DAY = MIN_PER_HOUR * 24

def time_of_day(initial_decimal_minutes)
  _, time_in_min = initial_decimal_minutes.divmod(MIN_PER_DAY)
  hours, minutes = time_in_min.divmod(MIN_PER_HOUR)

  "#{format('%02d', hours)}:#{format('%02d', minutes)}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
