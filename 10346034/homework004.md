def is_leap_year?(year)
 print year
  if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    puts"是潤年哦"
  else
    puts"不是潤年哦"
  end
end
puts is_leap_year?(1900)   
puts is_leap_year?(2000)     

