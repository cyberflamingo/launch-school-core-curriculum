def leap_year?(year)
  answer = false

  if year % 4 == 0
    answer = true
    if year % 100 == 0
      answer = false
      if year % 400 == 0
        answer = true
      end
    end
  end

  answer
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
