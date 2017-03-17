# 作業 004
* 請設計一個名為 is_leap_year? 的方法，可以判斷是不是閏年?<br />
Ans:<br />
```ruby
#閏年規則除以400可整除
#或除以4可整除但除以100不可整除，

def is_leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
end

puts is_leap_year?(1900)   # false
puts is_leap_year?(2000)   # true
```
