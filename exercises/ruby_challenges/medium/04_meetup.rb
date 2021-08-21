=begin

PEDAC
=====

(Understand the) Problem
------------------------

-  Inputs: A year, a month and a day of the week with a qualifier
-  Output: The correct civil date for the given information

---

**Problem Domain:**
String manipulation, date

---

**Implicit Requirements:**
-  Case not important
-  Has a madeup 'teenth' for the '-teenth' of the day

---

**Clarifying Questions:**

1.

---

**Mental Model:**
Given a year, a month and a descriptor for the day, find the correct civil date.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See test file

---

Data Structure
--------------
Date object

---

Algorithm
---------

1.  Initialize a new local variable raw_date to a hash with keys year, month and
day
2.  Reassign year and month of raw_date to the given parameters

#day
1.  If descriptor is `teenth`, return teenth_date(day)
2.  Initialize a new local variable breaker to the return value of
    `break_number` method
3.  Initialize new local variable `candidate_date` to []
4.  Iterate from 1 to 31 passing in day as an argument
  1.  Rescue date error and break
  2.  Instantiate a new date from `Date` passing in year, month and day
  3.  Save the result to `candidate_date` if `send` `week_day` + `?` returns
      true
  4.  Break if candidate_date.size == break_number
5.  Return the last element in `candidate_date`

#break_number(descriptor)
1.  Create a case statement taking `descriptor` as an argument
2.  Return the numeral of `descriptor`
  1.  Return -1 for `last`

#teenth_date
1.  Iterate from 13 upto 19 passing in day as an argument
  1.  Instantiate a new date from `Date` passing in year, month and day
  2.  Return it if `send` `week_day` + `?` returns true

Code
----

Time: 01:16:16.8

=end

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(week_day, descriptor)
    return teenth_date(week_day) if descriptor == 'teenth'

    breaker = break_number(descriptor.downcase)
    candidate_date = []
    meetup_date = nil

    1.upto(31) do |day|
      begin
        d = Date.civil(@year, @month, day)
        candidate_date << d if d.send(week_day.downcase + '?')
      rescue Date::Error
        break
      end

      if candidate_date.size == breaker
        meetup_date = candidate_date.last
        break
      end
    end

    descriptor == 'last' ? candidate_date.last : meetup_date
  end

  private

  def break_number(descriptor)
    case descriptor
    when 'first'  then 1
    when 'second' then 2
    when 'third'  then 3
    when 'fourth' then 4
    when 'fifth'  then 5
    when 'last'   then nil
    end
  end

  def teenth_date(week_day)
    13.upto(19) do |day|
      d = Date.civil(@year, @month, day)

      return d if d.send(week_day.downcase + '?')
    end
  end
end
