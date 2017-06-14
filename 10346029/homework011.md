### 請用「自己的話」舉例說明什麼叫做「Duck Typing」

撰寫程式初期不先定義物件類別，而是將原定義在類別中屬性及方法放在一個函式裡，當有東西呼叫此函式時，先將他當作此物件。此作法是用來測試他能不做，所以並不在乎他的物件類型。

```ruby

class Dog  
  def bark  
    puts "汪"
  end  
  
end  

def doBark(dog)  
  dog.bark  
end    
    
puts doBark(Dog.new)  
    

```

將 Dog 物件傳入doBark()的函式中印出 汪 


### 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。

類別方法與實體方法最大的差異是在於，使用類別方法不用先建立一個實體物件，可以直接使用。



```ruby

# instance

class Dog  

  def bark  
    puts "汪"
  end  
  
end  

dog = Dog.new
dog.bark

```



```ruby

# class

class Dog  

  def self.bark  
    puts "汪"
  end  
  
end  


Dog.bark

```

從上述例子我們會發現要用定義 class method 必須在方法前加 `self` 


### 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？

這兩種方法最大的差異在於程式碼嵌入的時機。<br>
include：在程式建立實例時才做繼承 <br>
extend：只繼承方法不繼承實例


```ruby
module Animal
  
  def eat
    puts "yummy"
  end
  
end

class Dog_include  
  include Animal  
end  

class Dog_extend
  extend Animal
end

Dog_extend.eat
Dog_extend.new.eat # 會出現 undefined method `eat' for #<Dog_extend:0x0055763708b6e8> 的錯誤

Dog_include.eat # 會出現 undefined method `eat' for Dog_include:Class 的錯誤
Dog_include.new.eat

```
