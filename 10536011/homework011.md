
### 1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」  
方法不受限於物件型態僅思考物件應當具有的行為。  
例如：有一個方法doQuack(鴨子叫)，參數```duck```不具型態，假設有一隻鳥叫聲像鴨子叫，則可以利用```duQuack```方法，做duck的quack方法。
```
 class Duck
  def quack
   puts "叫聲嘎嘎叫"
  end
 end
 
 def doQuack(duck)
   duck.quack
 end
 
 bird = Duck.new
 doQuack(bird) #印出 叫聲嘎嘎叫
 
```
### 2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。  
類別方法作用在類別上，實體方法作用在實體上。  
例如：  
```
 class BooksController < ApplicationController
   def index
     @books=Book.all
   end
 end
```
上面的```all```方法作用在```Book```這個類別上，稱為類別方法。
```
kitty = Cat.new
kitty.eat "柳葉魚"
```
上面的```eat```作用在```kitty```實體上，稱為實體方法。
### 3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？  
```include```讓所產生的實體```Cat```繼承模組```Flyable```的方法```fly```
```
  module Flyable
    def fly
      puts "I can fly!"
    end
  end
  
  class Cat
    include Flyable
  end

  kitty = Cat.new
  kitty.fly        # => I can fly!
```
```extend```則讓類別```Cat```具有模組```Flyable```的方法```fly```，但是不會繼承給實體。
```
  module Flyable
    def fly
      puts "I can fly!"
    end
  end
  
  class Cat
    include Flyable
  end

  Cat.fly        # => I can fly!
```
