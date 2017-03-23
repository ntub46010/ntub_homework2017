設計一個is_leap_year? 的方法，可以斷是不是閏年?

def is_leap_year?(year)

  if year % 4 == 0 && year % 400 == 0
     
     then year % 100 != 0
     
     return true
    
  else
  
    return false 
    
  end
  
end

puts is_leap_year?(1900) 

puts is_leap_year?(2000)
