=begin

PEDAC
=====

(Understand the) Problem
------------------------

-  Inputs: Hours and/or minutes
-  Output: The time formatted with the input

---

**Problem Domain:**
Arithmetic

---

**Implicit Requirements:**
-  Time is 24:00 format
-  Can format input up to24h or 60min
-  Is able to value + and - minutes to the `at` method

---

**Clarifying Questions:**

1. `at` method is assumed to have positive input only? (Yes)

---

**Mental Model:**
Create a clock class that takes 2 numbers, hours and minutes as an argument to
its method and return a formatted time in 24:00 format.

The method should optionally be able to take a `-` or `+` method with a number
of minutes and format time correctly.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See test file.

---

Data Structure
--------------
Variables to save hours and minutes.

---

Algorithm
---------

$ Method `#at`
1.  Initialize local variable `hour` to first given parameter
2.  Initialize local variable `min` to second given parameter (default to 0)

$ Method `#to_s`
1.  Use `#format` to format `hour` and `min` with 2 numbers and a leading 0 if
    applicable.
2. Return result

$ Method `#+`
1.  Add the given minutes to the class variable `mins`
2.  Check if class var `mins` >= 60
  1.  If yes, divmod it by 60 and save the result to two local var h and m
  2.  Add h to class var `hours`
  3.  Reassign @mins to point to local var m
3.  Check if class var `hours` >= 24
  1.  If yes, divmod it by 24 and save the result to two local var d and h
  2.  Reassign @hours to point to local var h
4.  Return self

$ Method `#-`
1.  Substract the given minutes to the class variable `mins`
2.  Check if class is negative
  1.  If yes, divmod it by 60 and save the result to two local var h and m
  2.  Substract h to class var `hours`
  3.  Reassign @mins to point to local var m
3.  Check if class var `hours` is negative
  1.  If yes, divmod it by 24 and save the result to two local var d and h
  2.  Reassign @hours to point to local var h
4.  Return self

Code
----

Time: 01:31:05.0

=end

class Clock
  def initialize(h, m)
    @hours = h
    @mins = m
  end

  def self.at(h, m = 0)
    new(h, m)
  end

  def to_s
    format("%02d:%02d", @hours, @mins)
  end

  def +(min)
    @mins += min

    redistribute_mins if @mins >= 60
    redistribute_hours if @hours >= 24

    self
  end

  def -(min)
    @mins -= min

    redistribute_mins if @mins.negative?
    redistribute_hours if @hours.negative?

    self
  end

  def ==(other)
    @hours == other.hours && @mins == other.mins
  end

  protected

  attr_reader :hours, :mins

  private

  def redistribute_mins
    h, m = @mins.divmod(60)
    @hours += h
    @mins = m
  end

  def redistribute_hours
    _, h = @hours.divmod(24)
    @hours = h
  end
end
