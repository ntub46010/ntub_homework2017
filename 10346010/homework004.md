def is_leap_year?(year)
  # 實作
  if (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

puts is_leap_year?(1900)   # false
puts is_leap_year?(2000)   # true
