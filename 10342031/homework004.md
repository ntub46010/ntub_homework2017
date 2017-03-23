# 作業 004
請設計一個名為 `is_leap_year?` 的方法，可以判斷是不是閏年?

4的倍數是閏年、100的倍數不閏但400的倍數為閏年
```ruby
def is_leap_year?(year)
 year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

 puts is_leap_year?(1900)
 puts is_leap_year?(2000)
```
