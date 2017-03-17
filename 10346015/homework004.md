def is_leap_year?(year)
  if  (year%400 == 0) or ((year%4 == 0) and (year%100 != 0))
    true
  else
    false
  end
end

puts is_leap_year?(1900)   
puts is_leap_year?(2000)   
