# homework004

```ruby
def is_leap_year?(year)
  year % 4 == 0 && year % 100 != 0 || year % 400 == 0 && year % 4000 != 0
end

years = [1992, 1996, 1700, 1800, 1900, 1600, 2000, 2400, 4000, 8000]

for year in years
  if is_leap_year?(year)
    puts "#{year}年 --> 閏年"
  else
    puts "#{year}年 --> 非閏年"
  end
end
```
