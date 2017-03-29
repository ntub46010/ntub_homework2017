def years(year)
     year 
    if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0 ) ## ||前滿足條件1  之後滿足條件2 條件3為憑年的條件不列在此
        return true
      else
        return false
    end
end

puts years(2000)   ##true
puts years(1999)   ##false


##1.西元年份除以4可整除，且除以100不可整除，為閏年。
##2.西元年份除以400可整除，為閏年。
##3.西元年份除以100可整除，且除以400不可整除，為平年
