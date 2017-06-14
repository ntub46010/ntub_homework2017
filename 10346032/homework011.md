1.Duck Typing定義 
當我定義一個duck的類型，那當我其他的物件符合duck的一些條件，那他就可以稱為duck

2.實體方法(instance method) 跟類別方法(class method) 的差別 

這差別在於instance method需要實體，而class method可以直接呼叫 
ex:

kitty = Cat.new("kitty", "female")
kitty.say_hello    (instance method)

class Cat
def self.all
  # ...
end
end(class method)

3.include 跟 extend，請舉例並說明這兩個方法的差別？

include是讓class所產生的物件直接繼承module裡的方法
ex:
module Log 
def class_type 
"This class is of type: #{self.class}" 
end 
end

class TestClass include Log end

tc = TestClass.new.class_type
puts tc #This class is of type: TestClass


extend則是讓class具有module裡的方法但不會繼承給物件
ex:
module Log
  def class_type
    "This class is of type: #{self.class}"
  end
end

class TestClass
 extend Log
 # ...

end
tc = TestClass.class_type puts tc # This class is of type: TestClass
