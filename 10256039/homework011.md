# 作業 011

1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」
    - 利用某類別是否具備某個方法來判斷是否為同一個物件
    - 假設 class a 跟 b 都有 m 這個方法就認為他是同一種類別
    - 利用一個類別是否具備特定的方法 (動作) 來決定他是否是同一種類別，而不是利用他是否繼承同一個父類別
    
    ```ruby
    class Cat
        def talk
            puts "Hello"
        end
    end
    
    class Dog
        def talk
            puts "Hello"
        end
    end
    
    def say_hello(object_that_can_talk)
        object_that_can_talk.talk
    end
    
    cat = Cat.new
    dog = Dog.new
    say_hello(cat)
    say_hello(dog)
    ```
    
2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
    - 要呼叫實體方法必須先實作那個類別，類別方法則可以使用類別直接呼叫
    
    ```ruby
    class Cat
        def self.talk
            puts "Hello"
        end
        
        def name(name)
            puts "My name is #{name}"
        end
    end
    
    Cat.talk  # 可以呼叫因為他是類別方法
    Cat.name("Kitty")  # 發生錯誤因為沒有實作這個類別
    cat = Cat.new
    cat.name("Kitty")  # 可以執行了～
    ```

3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
    - include 讓 model 的方法變成實體方法
    - extend 讓 model 的方法變成類別方法
