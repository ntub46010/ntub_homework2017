1.	請用「自己的話」舉例說明什麼叫做「Duck Typing」?

鴨子型別(Duck Typing)：方法可以不受型別定義的限制 
例如：一般的鴨子叫聲是嘎嘎、羽毛是白色，但是如果使用duck typing的話，即使聲音不是嘎嘎、羽毛顏色不是白色，也可以是鴨子。換一個說法，鴨子有很多品種，大家一般聯想到的鴨子，是『家鴨』(白色的)，而『綠頭鴨』牠不是白色的，是綠色的，但牠也稱作為鴨子

class Duck:
    def quack(self): 
        print "這鴨子在呱呱叫"
    def feathers(self): 
        print "這鴨子擁有白色與灰色羽毛"

2.	請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
   	
    (1)實體方法：使用實體方法，必須使用new方法。

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


    (2)extend：類別(class)，本身具有模組(module)裡的方法，但是不會繼承給實體。

         module Flyable
             def fly
                puts "I can fly!"
               end
             end

         class Cat
             include Flyable
          end

         Cat.fly        # => I can fly!

