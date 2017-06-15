1.	請用「自己的話」舉例說明什麼叫做「Duck Typing」?

鴨子型別(Duck Typing)：方法可以不受型別定義的限制 
例如：有一隻狗狗，牠的叫聲跟鴨子一樣，那牠就也可以叫鴨子
 
  def quack(duck) 
    duck.quack
  end

  class Dog
  end

  dog = Dog.new
  def dog.quack  
   puts "quack"
end


2.	請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
   	
    (1)實體方法：使用類別方法，且必須使用new。
    
       例如：
       kitty = Cat.new
       kitty.eat "鮪魚罐頭"  #=> 印出「鮪魚罐頭 好好吃!!」

    (2)類別方法：使用類別方法 不需要使用new方法，可直接呼叫。
    
       例如：
       class Cat
           def eat(food)
              puts "#{food} 好好吃!!"
           end
       end

3.  在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
   
    (1)Include：類別(class)，繼承模組(module)裡的方法，有一個實體(new)需要此方法， 繼承了此方法之後，它就有此功能。

          例如：有一個類別為Cat，有一個模組為Flyable，Flyable裡面有一個方法叫fly，kitty是一個實體，需要此方法，因此使用include之後，便可擁有fly這個方法。

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


    (2)extend：類別(class)具有模組(module)裡的方法，但是類別卻不會繼承給實體。

        例如：有一個類別為Cat，它有模組-Flyable裡的方法-fly，使用extend之後，類別-Cat，只能使用fly這個方法。


         module Flyable
             def fly
                puts "I can fly!"
               end
             end

         class Cat
             include Flyable
          end

         Cat.fly        # => I can fly!

