def is_leap_year?(year)
  if year.is_a?(Integer)
     return true if year % 400 == 0 or (year % 4 == 0 && year % 100 != 0 )
  end
  return false
end
