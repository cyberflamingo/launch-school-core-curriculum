DEG = "\xC2\xB0"
DEG_MIN = 0
DEG_MAX = 360
MIN_PER_DEG = 60
SEC_PER_MIN = 60
SEC_PER_DEG = MIN_PER_DEG * SEC_PER_MIN

def appropriate_range(angle)
  _, rest = angle.divmod(DEG_MAX)
  in_range_angle = if    rest < DEG_MIN then rest + DEG_MAX
                   elsif rest > DEG_MAX then rest - DEG_MAX
                   else  rest
                   end

  in_range_angle
end

def dms(angle)
  dd = appropriate_range(angle)
  d = dd.to_i
  m = ((dd - d) * MIN_PER_DEG).to_i
  s = (dd - d - m.to_f / SEC_PER_MIN) * SEC_PER_DEG

  format(%(%d#{DEG}%02d'%02d"), d, m, s)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00") || dms(254.6) == %(254°35'59")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
