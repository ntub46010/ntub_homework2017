1.鴨子型別，他關注的並不是物件的類型本身，而是它是如何使用的。例如
def dodo(puppy) 
   print "haha"
end
class Dog
end
dog = Dog.new
def dog.dodo
end
定義一個dodo方法，參數是puppy，並定義一個Dog類別，再用new方法建立一個dog，並且用dog去呼叫dodo方法，而dodo方法中的參數puppy變成dog，並印出haha
2.如果這個方法是一個實體去呼叫的話，他就是實體方法
例如def haha
end
class Dog
end
dog = Dog.new
dog.haha，那這個就是實體方法
但是如果這個方法是對整個類別的話，那就是類別方法，
例如class Dog
def self.all
end
end
而這個就是類別方法
3.include是讓類別所新增的實體直接繼承module裡的方法，但是extend則是讓類別具有module裡的方法，但不會繼承給實體
module voice 
def  won 
puts "won won " 
end 
end
class Dog
include voice 
end
gino = Dog.new 
gino.won
class Cat 
extend voice 
end
joyce = Cat.new
joyce.won
類別Dog用include繼module voice 裡的won方法，並讓dog新增的實體gino繼承 
但類別Cat用extend繼承voice裡的won方法，但並不會繼承給實體joyce，所以joyce不能呼叫這個方法
