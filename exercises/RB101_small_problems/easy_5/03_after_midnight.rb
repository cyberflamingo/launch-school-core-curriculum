MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def extract_time_hash(time_str)
  time_hsh = { h: 0, min: 0 }

  time_hsh[:h], time_hsh[:min] = time_str.split(':').map(&:to_i)
  time_hsh[:h] = 0 if time_hsh[:h] == 24

  time_hsh
end

def after_midnight(str)
  time_hsh = extract_time_hash(str)

  (time_hsh[:h] * MINUTES_PER_HOUR) + time_hsh[:min]
end

def before_midnight(str)
  time_hsh = extract_time_hash(str)

  delta_minutes = MINUTES_PER_DAY - (time_hsh[:h] * MINUTES_PER_HOUR) -
                  time_hsh[:min]
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY

  delta_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

p after_midnight('23:57') == 1437
p before_midnight('23:57') == 3
p after_midnight('00:35') == 35
p before_midnight('00:35') == 1405
p after_midnight('00:03') == 3
p after_midnight('13:20') == 800
p before_midnight('13:20') == 640
p before_midnight('00:03') == 1437
