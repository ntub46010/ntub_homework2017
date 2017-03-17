def is_leap_year?(year)

  if
    year % 400 == 0 || (year % 4 == 0 and year % 100 != 0)
    return "閏年"
  else
    return "平年"
  end
  
end

puts is_leap_year?(1900)   # false
puts is_leap_year?(2000)   # true
