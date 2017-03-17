def is_leap_year? (year)
  (year % 4 ==0) && (not (year % 100 ==0) or (year % 400 == 0))
end

puts is_leap_year?(2000)
puts is_leap_year?(1900)
