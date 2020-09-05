require 'date'

MONTHS = (1..12).to_a

def friday_13th(year)
  day = 13
  friday_13th_count = 0

  MONTHS.each do |month|
    date = Date.new(year, month, day)
    friday_13th_count += 1 if date.friday?
  end

  friday_13th_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
