# frozen_string_literal: true

=begin rdoc

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
0. Initialize a hash `time` with keys :days, :hours and :minutes set to 0
1. Convert the given `initial_decimal_minutes` integer in seconds ( * 60)
2. Divmod the above result by 86,400
   1. Save the first result
   2. Discard the remainders? Save the remainders in time[:days]
3. Divmod the above result by 3600
   1. Save the first result in time[:hours]
   2. Save the remainders
4. Divmod the above result by 60
   1. Save the first result in time[:minutes]
   2. Discard the remainding seconds
5. Get the values of the hash
  1. Join the values and format them to fit the "hh:mm" format requirement
  2. Return the result

== Code

=end

MIN_TO_SEC = 60
HOUR_TO_SEC = MIN_TO_SEC * 60 # 3600
DAY_TO_SEC = HOUR_TO_SEC * 24 # 86_400

def time_of_day(initial_decimal_minutes)
  time = { hours: 0, minutes: 0 }
  decimal_seconds = initial_decimal_minutes * MIN_TO_SEC

  _, decimal_seconds = decimal_seconds.divmod(DAY_TO_SEC)

  time[:hours], decimal_seconds = decimal_seconds.divmod(HOUR_TO_SEC)
  time[:minutes], = decimal_seconds.divmod(MIN_TO_SEC)

  # puts 'hours: ' + time[:hours].to_s
  # puts 'minutes: ' + time[:minutes].to_s

  format('%02d:%02d', time[:hours], time[:minutes])
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
