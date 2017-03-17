def is_leap_year?(year)
  if year * 400
end

puts is_leap_year?(1900)   # false
puts is_leap_year?(2000)   # true
#年份可以被 400 整除, 是閏年.
#年份不能被 100 整除, 但可以被 4 整除, 是閏年.
