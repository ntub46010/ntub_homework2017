1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」
A：鴨子型別可以接受不同type的物件呼叫它的方法，不用在乎物件的型別。
def doQuack(duck)
    duck.quack
end

duck沒有任何型態宣告，所以不會有任何型態約束，只要傳進來的物件具有quack方法就可以。

2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
A：instance method要一個實體物件才能呼叫；class method 可以直接用類別呼叫。
class Cat
    def eat(food)
      puts "好吃!!"
    end
    def self.swimming
      puts "游泳!"
    end
end
kitty = Cat.new
kitty.eat "鮪魚罐頭"
Cat.swimming

呼叫eat之前先new一個實體變數，eat方法作用在變數kitty→→→→→實體方法；呼叫swimming不用有實體變數，在類別上呼叫方法就可以了→→→→→類別方法

3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
A：include是class產生的實體繼承模組中的方法；extend是讓這個class具有模組中的方法，卻不會繼承給實體。
module Foo
  def foo
    puts 'heyyyyoooo!'
  end
end

class Bar
  include Foo
end

Bar.new.foo
Bar.foo

class Baz
  extend Foo
end
Baz.foo
Baz.new.foo

類別Bar用include方法繼承模組Foo裡的foo方法給Bar產生的實體foo；類別Baz用extend方法直接繼承Foo裡的foo方法，不會繼承給實體，如果實體化呼叫會發生錯誤。
