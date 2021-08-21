require 'minitest/autorun'
require 'date'
require_relative '04_meetup'

# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule).
# where weekday is one of: monday, tuesday, wednesday, etc.
# and schedule is first, second, third, fourth, fifth, last, or teenth.

class MeetupTest < Minitest::Test
  def test_first_monday_of_march_2013
    meetup = Meetup.new(2013, 3)
    assert_equal Date.civil(2013, 3, 4), meetup.day('Monday', 'first')
  end

  def test_first_monday_of_april_2013
    meetup = Meetup.new(2013, 4)
    assert_equal Date.civil(2013, 4, 1), meetup.day('monday', 'FIRST')
  end

  def test_first_tuesday_of_may_2013
    meetup = Meetup.new(2013, 5)
    assert_equal Date.civil(2013, 5, 7), meetup.day('Tuesday', 'first')
  end

  def test_first_wednesday_of_june_2013
    meetup = Meetup.new(2013, 6)
    assert_equal Date.civil(2013, 6, 5), meetup.day('wednesday', 'first')
  end

  def test_first_thursday_of_july_2013
    meetup = Meetup.new(2013, 7)
    assert_equal Date.civil(2013, 7, 4), meetup.day('Thursday', 'first')
  end

  def test_first_friday_of_august_2013
    meetup = Meetup.new(2013, 8)
    assert_equal Date.civil(2013, 8, 2), meetup.day('Friday', 'first')
  end

  def test_first_saturday_of_september_2013
    meetup = Meetup.new(2013, 9)
    assert_equal Date.civil(2013, 9, 7), meetup.day('Saturday', 'first')
  end

  def test_first_sunday_of_october_2013
    meetup = Meetup.new(2013, 10)
    assert_equal Date.civil(2013, 10, 6), meetup.day('Sunday', 'first')
  end

  def test_second_monday_of_november_2013
    meetup = Meetup.new(2013, 11)
    assert_equal Date.civil(2013, 11, 11), meetup.day('Monday', 'second')
  end

  def test_second_tuesday_of_december_2013
    meetup = Meetup.new(2013, 12)
    assert_equal Date.civil(2013, 12, 10), meetup.day('Tuesday', 'second')
  end

  def test_second_wednesday_of_january_2014
    meetup = Meetup.new(2014, 1)
    assert_equal Date.civil(2014, 1, 8), meetup.day('Wednesday', 'second')
  end

  def test_second_thursday_of_february_2014
    meetup = Meetup.new(2014, 2)
    assert_equal Date.civil(2014, 2, 13), meetup.day('Thursday', 'second')
  end

  def test_second_friday_of_march_2014
    meetup = Meetup.new(2014, 3)
    assert_equal Date.civil(2014, 3, 14), meetup.day('Friday', 'second')
  end

  def test_second_saturday_of_april_2014
    meetup = Meetup.new(2014, 4)
    assert_equal Date.civil(2014, 4, 12), meetup.day('Saturday', 'second')
  end

  def test_second_sunday_of_may_2014
    meetup = Meetup.new(2014, 5)
    assert_equal Date.civil(2014, 5, 11), meetup.day('Sunday', 'second')
  end

  def test_third_monday_of_june_2014
    meetup = Meetup.new(2014, 6)
    assert_equal Date.civil(2014, 6, 16), meetup.day('Monday', 'third')
  end

  def test_third_tuesday_of_july_2014
    meetup = Meetup.new(2014, 7)
    assert_equal Date.civil(2014, 7, 15), meetup.day('Tuesday', 'third')
  end

  def test_third_wednesday_of_august_2014
    meetup = Meetup.new(2014, 8)
    assert_equal Date.civil(2014, 8, 20), meetup.day('Wednesday', 'third')
  end

  def test_third_thursday_of_september_2014
    meetup = Meetup.new(2014, 9)
    assert_equal Date.civil(2014, 9, 18), meetup.day('Thursday', 'third')
  end

  def test_third_friday_of_october_2014
    meetup = Meetup.new(2014, 10)
    assert_equal Date.civil(2014, 10, 17), meetup.day('Friday', 'third')
  end

  def test_third_saturday_of_november_2014
    meetup = Meetup.new(2014, 11)
    assert_equal Date.civil(2014, 11, 15), meetup.day('Saturday', 'third')
  end

  def test_third_sunday_of_december_2014
    meetup = Meetup.new(2014, 12)
    assert_equal Date.civil(2014, 12, 21), meetup.day('Sunday', 'third')
  end

  def test_fourth_monday_of_january_2015
    meetup = Meetup.new(2015, 1)
    assert_equal Date.civil(2015, 1, 26), meetup.day('Monday', 'fourth')
  end

  def test_fourth_tuesday_of_february_2015
    meetup = Meetup.new(2015, 2)
    assert_equal Date.civil(2015, 2, 24), meetup.day('Tuesday', 'fourth')
  end

  def test_fourth_wednesday_of_march_2015
    meetup = Meetup.new(2015, 3)
    assert_equal Date.civil(2015, 3, 25), meetup.day('Wednesday', 'fourth')
  end

  def test_fourth_thursday_of_april_2015
    meetup = Meetup.new(2015, 4)
    assert_equal Date.civil(2015, 4, 23), meetup.day('Thursday', 'fourth')
  end

  def test_fourth_friday_of_may_2015
    meetup = Meetup.new(2015, 5)
    assert_equal Date.civil(2015, 5, 22), meetup.day('Friday', 'fourth')
  end

  def test_fourth_saturday_of_june_2015
    meetup = Meetup.new(2015, 6)
    assert_equal Date.civil(2015, 6, 27), meetup.day('Saturday', 'fourth')
  end

  def test_fourth_sunday_of_july_2015
    meetup = Meetup.new(2015, 7)
    assert_equal Date.civil(2015, 7, 26), meetup.day('Sunday', 'fourth')
  end

  def test_fifth_monday_of_august_2015
    meetup = Meetup.new(2015, 8)
    assert_equal Date.civil(2015, 8, 31), meetup.day('Monday', 'fifth')
  end

  def test_fifth_tuesday_of_september_2015
    meetup = Meetup.new(2015, 9)
    assert_equal Date.civil(2015, 9, 29), meetup.day('Tuesday', 'fifth')
  end

  def test_fifth_wednesday_of_october_2015
    meetup = Meetup.new(2015, 10)
    assert_nil meetup.day('Wednesday', 'fifth')
  end

  def test_fifth_thursday_of_november_2015
    meetup = Meetup.new(2015, 11)
    assert_nil meetup.day('Thursday', 'fifth')
  end

  def test_fifth_friday_of_december_2015
    meetup = Meetup.new(2015, 12)
    assert_nil meetup.day('Friday', 'fifth')
  end

  def test_fifth_saturday_of_january_2016
    meetup = Meetup.new(2016, 1)
    assert_equal Date.civil(2016, 1, 30), meetup.day('Saturday', 'fifth')
  end

  def test_fifth_sunday_of_february_2016
    meetup = Meetup.new(2016, 2)
    assert_nil meetup.day('Sunday', 'fifth')
  end

  def test_fifth_monday_of_february_2016
    meetup = Meetup.new(2016, 2)
    assert_equal Date.civil(2016, 2, 29), meetup.day('Monday', 'fifth')
  end

  def test_last_monday_of_march_2016
    meetup = Meetup.new(2016, 3)
    assert_equal Date.civil(2016, 3, 28), meetup.day('Monday', 'last')
  end

  def test_last_tuesday_of_april_2016
    meetup = Meetup.new(2016, 4)
    assert_equal Date.civil(2016, 4, 26), meetup.day('Tuesday', 'last')
  end

  def test_last_wednesday_of_may_2016
    meetup = Meetup.new(2016, 5)
    assert_equal Date.civil(2016, 5, 25), meetup.day('Wednesday', 'last')
  end

  def test_last_thursday_of_june_2016
    meetup = Meetup.new(2016, 6)
    assert_equal Date.civil(2016, 6, 30), meetup.day('Thursday', 'last')
  end

  def test_last_friday_of_july_2016
    meetup = Meetup.new(2016, 7)
    assert_equal Date.civil(2016, 7, 29), meetup.day('Friday', 'last')
  end

  def test_last_saturday_of_august_2016
    meetup = Meetup.new(2016, 8)
    assert_equal Date.civil(2016, 8, 27), meetup.day('Saturday', 'last')
  end

  def test_last_sunday_of_september_2016
    meetup = Meetup.new(2016, 9)
    assert_equal Date.civil(2016, 9, 25), meetup.day('Sunday', 'last')
  end

  def test_last_sunday_of_february_2015
    meetup = Meetup.new(2015, 2)
    assert_equal Date.civil(2015, 2, 22), meetup.day('Sunday', 'last')
  end

  def test_teenth_monday_of_october_2016
    meetup = Meetup.new(2016, 10)
    assert_equal Date.civil(2016, 10, 17), meetup.day('Monday', 'teenth')
  end

  def test_teenth_tuesday_of_november_2016
    meetup = Meetup.new(2016, 11)
    assert_equal Date.civil(2016, 11, 15), meetup.day('Tuesday', 'teenth')
  end

  def test_teenth_wednesday_of_december_2016
    meetup = Meetup.new(2016, 12)
    assert_equal Date.civil(2016, 12, 14), meetup.day('Wednesday', 'teenth')
  end

  def test_teenth_thursday_of_january_2017
    meetup = Meetup.new(2017, 1)
    assert_equal Date.civil(2017, 1, 19), meetup.day('Thursday', 'teenth')
  end

  def test_teenth_friday_of_february_2017
    meetup = Meetup.new(2017, 2)
    assert_equal Date.civil(2017, 2, 17), meetup.day('Friday', 'teenth')
  end

  def test_teenth_saturday_of_march_2017
    meetup = Meetup.new(2017, 3)
    assert_equal Date.civil(2017, 3, 18), meetup.day('Saturday', 'teenth')
  end

  def test_teenth_sunday_of_april_2017
    meetup = Meetup.new(2017, 4)
    assert_equal Date.civil(2017, 4, 16), meetup.day('Sunday', 'teenth')
  end
end
