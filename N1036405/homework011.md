# 作業 011

* 請用「自己的話」舉例說明什麼叫做「Duck Typing」<br />
ANS:<br />
鴨子型別就是動態型別，在這種情況下，一個物件的意義不是由它所繼承的類別或是實作的介面來定義，<br />
而是由它本身的方法或屬性的集合來決定。<br />
在網路上看到一句話，老師在課堂上也說過<br />
鴨子型別就是當我看到一隻鳥，它走路像鴨子，游泳像鴨子，叫聲像鴨子，我就把它當作鴨子<br />
這句話是最能解釋鴨子型別的意思，我不在乎這隻鳥是繼承自哪裡，<br />
而是根據它的行為，我覺得它像鴨子，我就將它定義為鴨子。<br />
舉個例子:<br />

```
class Animal
  def result
  	puts "Animal will eat their food."
  end
  def eat(animal)
  	animal.result
  end
end

class Cat < Animal
  def result
  	puts "Cat eats mouse."
  end
end

animal = Animal.new
cat = Cat.new

animal.eat(animal)
animal.eat(cat)
```

* 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。<br />
ANS:<br />
類別方法就是使用某一類別呼叫該類別的方法，<br />
而實體方法就是針對某個實體(物件)呼叫它的方法。<br />
舉個例子:<br />

```
#instance method
class Meow
  def meow
    puts "meow"
  end
end

cat = Meow.new
cat.meow

#class method
class Woof
  def self.woof
    puts "woof"
  end
end

Woof.woof

```
看來我們平常物件導向使用的方法應該是實體方法，<br />
直接用類別呼叫它自身的方法，這種方式到目前為止很少見到。<br />

* 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？<br />
ANS:<br />
include是將類別的實例(也就是物件)繼承某個模組的方法<br />
而extend則是讓類別繼承某個模組的方法<br />
舉個例子:<br />
```
module Meow
  def meow
    puts "meow~~~~"
  end
end

class Dog
  include Meow
end

Dog.new.meow

--------------------

module Meow
  def meow
    puts "meow~~~~"
  end
end

class Dog
  extend Meow
end

Dog.meow

```
