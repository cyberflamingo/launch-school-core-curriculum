require 'date'

DAYS_IN_WEEK = 7

def first_friday_of_year(year)
  date = Date.new(year, 1, 1)

  until date.friday?
    date += 1
  end

  date
end

def month_with_five_friday(year)
  friday_count = { January: 0, February: 0, March: 0, April: 0,
                   May: 0, June: 0, July: 0, August: 0,
                   September: 0, October: 0, November: 0, December: 0 }
  date = first_friday_of_year(year)

  while date.year == year
    month_name = date.strftime('%B')
    friday_count[month_name.to_sym] += 1
    date += DAYS_IN_WEEK
  end

  friday_count.values.count { |month| month == 5 }
end

p month_with_five_friday(2015) == 4
p month_with_five_friday(1986) == 4
p month_with_five_friday(2019) == 4
p month_with_five_friday(2021) == 5
