# 作業 011
	
## 1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」
「Duck Typing」：定義一個「方法」，不管物件屬於何種型別，只要該物件適合「方法」，任何物件都能呼叫此「方法」。
```ruby
def quack(duck) 
    duck.quack
 end

class People
 end

people = People.new
	def people.quack  
  puts "quack"
 end
quack(people)
#印出quack
#當物件「人」可以像鴨子呱呱叫，「人」就是鴨子。

```

## 2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。

實體方法(instance method)：對一個類別之中的某一個變數下指令、需要new一個實體物件才能呼叫
```ruby
class Bird
  def say_hello
  puts "Hello.I'm a bird."
  end
end

peacock = Bird.new
peacock.say_hello #Bird.new.say_hello
#印出Hello.I'm a bird. 
```

類別方法(class method)：對一個類別下指令、不需new一個實體物件，method前方+self即可呼叫
```ruby
class Bird
  def self.say_hello
  puts"Hello.I'm a bird."
  end
end
Bird.say_hello
#印出Hello.I'm a bird.
```

## 3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
Include是 「實體方法」，讓某一個類別（狗）中的實體變數（小黑）繼承擁有module(飛）
Extend是 「類別方法」，讓某一個類別（貓）的全體都擁有module(飛）
```ruby
module Flyable
  def fly
  puts "I can fly !"
  end
end

class Dog
  include Flyable
end

class Cat
  extend Flyable
end

black = Dog.new
black.fly
#Dog.new.fly

Cat.fly
#印出
#I can fly ! 小黑會飛                                                                                                                            
#I can fly ! 貓會飛
```
