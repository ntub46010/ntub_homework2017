# 作業 011

1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」
  
 Duck Typing 鴨子型別，住要是說一個方法的本身命名會跟這方法有關係，會較鴨子是因為有個人提出鴨子測試
 所以有句話
  
 `「當看到一隻鳥走起來像鴨子、游泳起來像鴨子、叫起來也像鴨子，那麼這隻鳥就可以被稱為鴨子。」`
 
 以下是程式
 
 ```bash
class Dog  
  def wow  
    'wow!'  
  end  
  def sleep  
    'Sleep...'  
  end  
end  
 
def make_it_wow(dog)  
  dog.wow  
end  

puts make_it_wow(Dog.new)  
```
 
 

2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
  
  這兩個差別在於寫程式的特色~
  (instance method)
  會用到initialize 先把變數設定好之後，就比較輕鬆，就像寫物件導向方法，新增方法用NEW 
  (class method)
  就是將所有便是都放進各個方法當中，雖然會覺得很麻煩多餘，然後冗長看不懂，但之後可以省下寫下新增方法 NEW 
  
  ```bash
  # instance 的方式
class Mynameis1
  def initialize(name) # 這邊比較麻煩
    @name = name
  end

  def hello
    puts "My name is #{@name}!"
  end
  
end

# 執行
myname = Mynameis1.new("Eric") # 比較有物件導向的感覺
myname.hello


# class method 的方式

class Mynameis2
  def self.hello(name) # 之後這邊多會很醜
   puts "My name is #{name}!"
  end

end

# 執行
Mynameis2.hello "Eric"  # 不用NEW

```
  

3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？

  ruby有module的概念
  主要來避免混入時重複的程式碼
  include
  class的新實例繼承module中的方法
  
  extend
  是讓class具有module中的方法，所以不用new，
  卻不會繼承給instance。
  
  ```bash
  module Dog 
  def dog_name
    "My name is #{self.class}"
  end
end

class Budy 
  include Dog
end

dogname = Budy.new.dog_name
puts dogname # 會繼承 module Dog 的方法

module Dog 
  def dog_name
    "My name is #{self.class}"
  end
end

class Budy
  extend Dog
  

end

dogname = Budy.dog_name
puts dogname   # 不會繼承 module Dog 的方法
```  
  
  
  
