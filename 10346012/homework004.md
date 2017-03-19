#請設計一個名為 is_leap_year? 的方法，可以判斷是不是閏年?

def is_leap_year?(year)
  if year % 400 == 0 || year % 4 == 0 && year % 100 != 0     
      true
    else
      false
    end
      
end

puts is_leap_year?(1900)   # false
puts is_leap_year?(2000)   # true
