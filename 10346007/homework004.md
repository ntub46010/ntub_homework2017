<br>def is_leap_year?(year)
<br>  if year.is_a?(Integer)
<br>     return true if year % 400 == 0 or (year % 4 == 0 && year % 100 != 0 )
<br>  end
<br>  return false
<br>end
