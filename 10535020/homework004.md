def is_leap_year?(year)
 if year % 4 ==0 and year % 100 ==0 and year % 400==0
   true
 else 
   false
 end
end

puts is_leap_year?(1900)   # false
puts is_leap_year?(2000)   # true
