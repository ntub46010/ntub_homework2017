1.請用「自己的話」舉例說明什麼叫做「Duck Typing」
不必去在乎物件類別的型態，只需關注如何使用就好了
假設有隻鳥的叫聲像嘎嘎聲，就判定他為Duck。

class Duck
  def quack
    puts "嘎嘎"
  end
end
def doQuack(duck)
  Duck.quack
end
puts doQuack(Bird.new)

2.請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
實體方法需要建立實體物件才可使用，類別方法則可直接拿來使用。

class PPAP
 def Pen
   puts "I have a pen"
  end
end
piko = PPAP.new #實體方法需要建立實體物件
piko.Pen

class Piko
  def self.apple
    puts "I have a apple"
  end
end
Piko.apple #類別方法可直接透過類別呼叫

3.在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
