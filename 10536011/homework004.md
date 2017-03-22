def is_leap_year?(year)
  answer=(year % 4 == 0 && year % 100 !=0 || year % 400 ==0) ? "true" : "false"
  puts answer
end

puts is_leap_year?(1900)   # false
puts is_leap_year?(2000)   # true
