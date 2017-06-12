1.請用「自己的話」舉例說明什麼叫做「Duck Typing」
  Duck Typing：定義一個方法，可以讓不同種類的物件呼叫此方法，而不用在乎物件的型別，只要注意能不能做想要做的事或想傳遞的訊息。
  
  def quack(duck) 
    duck.quack
  end

  class Dog
  end

  dog = Dog.new
  def dog.quack  
    puts "quack"
  end
  quack(dog)

  #定義一個quack方法，參數是duck，沒有型態宣告，能用dog去呼叫quack方法，參數duck變成dog呼叫dog.quack方法最後輸出quack
  
--------------------------------------------------------------------------------------------------------------------

2.請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
  實體方法：要呼叫實體方法必須要先new一個實體物件
  類別方法：呼叫類別方法不需要實體物件，可直接呼叫

 class Cat
  def talk
      puts "I'm a cat!"
  end
  
  def self.run
    puts "I'm running."
  end
  end

  lucy = Cat.new
  lucy.talk
  Cat.run

  #在呼叫talk方法前要先new一個實體變數，而talk方法用在實體變數lucy上，所以是實體方法
  #呼叫run方法不用有實體變數，直接在類別上呼叫方法就可以，所以是類別方法

--------------------------------------------------------------------------------------------------------------------

3.在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
  include：可以讓Class所new出來的instance繼承Module裡的方法
  extend：讓Class直接繼承Module裡面的方法，而不會繼承給instance

  module Hunger 
    def eat
      puts "I'm eating."
    end
  end

  class Cat 
    include Hunger 
  end

  nancy = Cat.new
  nancy.eat


  class Dog
    extend Hunger
  end

  bob = Dog.eat

  #類別Cat用include繼承模組Hunger裡的eat方法給Cat產生的實體nancy
  #類別Dog用extend直接繼承Hunger裡的eat方法，不會繼承給實體，實體化呼叫方法會發生錯誤

