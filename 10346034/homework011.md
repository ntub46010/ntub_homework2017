1.請用「自己的話」舉例說明什麼叫做「Duck Typing」
Duck Typing是動態型別，不在乎物件的型別，呼叫正確就可以用
假設今天A跟B都要停車，A停的完美進入停車格，但B停的歪的

2.請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
實體方法(instance method):必須要建立物件以後，以物件來呼叫方法。
類別方法(class method):直接呼叫方法。

實體方法
class Taxi
 def  calls
  end
  end
  taxi=Taxi.new
  taxi.calls
類別方法
class Taxi
  def park  
  end
  end
  
3.在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
include:使用實體方法，建立的物件可以直接使用繼承
extend:只能呼叫類別方法，建立實體以後無法呼叫該繼承方法。
