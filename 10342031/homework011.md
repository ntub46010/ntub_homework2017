# 作業 011

1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」

中譯成"鴨子型別"，依照物件的"行為"來接受引數，而不是type。
```ruby
class Phone
  def say
        puts "It's a phone."
  end
  def call(phone)
        phone.say
  end
end

class Iphone < Phone
  def say
    puts "It's an iphone."
  end
end

class Htc < Phone
  def say
    puts "It's a htc."
  end
end

iphone = Phone.new
htc = Phone.new
phone = Phone.new

phone.call(phone)
phone.call(iphone)
phone.call(htc)

# It's a phone.
# It's an iphone.
# It's a htc.
 
```
透過phone.call方法，傳遞給不同物件而產生了不同行為。

2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
```ruby
class Greet
  def initialize(name)
    @name = name
  end

  def hi
    "Hi, #{@name}"
  end

  def question
    "How's going, #{@name}?"
  end
end

greet = Greet.new("Amy")
greet.hi
greet.question
```
`Greet`會執行`initialize`這個方法，新的實體變數會自動帶入，看起來比較簡單。
```ruby
class Greet
  def self.hi(name)
    "Hi, #{name}"
  end

  def self.question(name)
    "How's going, #{name}?"
  end
end

Greet.hi "Amy"
Greet.question "Amy"
```
在名稱前面加上`self`或是類別名稱的方法，而且不需要先製造出`.new`實體物件就能用。
缺點是程式碼可能較不明確(每個類別方法前面都加入了`self`)


3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？

