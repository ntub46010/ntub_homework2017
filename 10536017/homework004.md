def is_leap_year?(year)  #設一個副程式，名為is_leap_year

  if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    puts "true"
  else
    puts "false"
  end
end
  is_leap_year?(1900)   # false,執行副程式，並判斷”1900年"是不是閏年
  is_leap_year?(2000)   # true,執行副程式，並判斷”2000年"是不是閏年
