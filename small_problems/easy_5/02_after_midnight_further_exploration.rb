require 'date'

SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
REF_DATE = Date.parse('Sunday')
REF_TIME = Time.local(REF_DATE.year, REF_DATE.month, REF_DATE.day, 0, 0)

def time_of_day(delta_minutes)
  new_date = REF_TIME + (delta_minutes * SECONDS_PER_MINUTE)
  new_date.strftime('%A %H:%M')
end

p time_of_day(0) == "Sunday 00:00"
p time_of_day(-3) == "Saturday 23:57"
p time_of_day(35) == "Sunday 00:35"
p time_of_day(-1437) == "Saturday 00:03"
p time_of_day(3000) == "Tuesday 02:00"
p time_of_day(800) == "Sunday 13:20"
p time_of_day(-4231) == "Thursday 01:29"
