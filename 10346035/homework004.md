def is_leap_year?(year)
  if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    puts "閏年"
  else 
    puts "平年"
  end
end

is_leap_year?(2000) 
is_leap_year?(1999)
