# 作業 011

1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」  
   假設function的參數沒有任何形態宣告，而裡面執行該參數的方法，此時無論是帶入什麼樣類型的物件，只要該物件有這個方法都可以使用此function
```ruby
def f(duck)
  duck.qua
end

f(dog) #沒有qua方法，下面可滿足

def dog.qua
  print "qua"
end
```
2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。  
   實體方法需要new一個新的實體才能使用  
   類別方法可直接被類別名稱使用  
   兩者不能交換使用，實體物件無法使用類別方法  
```ruby
class pp
 def f1 #實體方法
   ...
 end
  
 def self.f2  #類別方法
   ...
 end
end
```
3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？  
   include是使用實體方法  
   extend是使用類別方法
```ruby
module fff
  def fc
    puts "hey"
  end
end

class fa
  include fc
end

class fb
  extend fc
end

fa.new.fc #fa建立實體繼承fff module裡的fc方法
fb.fc #fb類別具有fff module裡的fc方法，產生的實體無法繼承fc方法
```
