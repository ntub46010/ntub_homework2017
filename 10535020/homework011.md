1.Duck typing:最初起源於-當我看到一隻鳥，它走路像鴨子，游泳像鴨子，叫聲像鴨子，我就稱其為鴨子。意思是不管原本物件的型別是用什麼，只要套用在鴨子型別就可以使用此類別的方法，物件型別是什麼並不重要，重要的是行為是否正確或符合需求。

舉例：

def doQuack(duck)

    duck.quack
    
end

dog = Dog.new

def dog.quack

    print "quack"
    
end

doQuack(dog)

2.實體方法是直接作用在實體上,舉例：

puppy = Dog.new("puppy","male")

puppy.say_hi

say_hi直接作用在puppy實體上

而類別方法,範圍較小，舉例：

def load

  @run=Go.all
  
end

這個方法直接作用在Go類別上

3.
module Socre

  def socre

    puts 'nice!'  

  end 

end

class English

  include Socre

end 

English.new.socre # nice

English.socre # NoMethodError: undefined method ‘socre’ for English:Class 

class Chinese   

  extend Score

end 

Chinese.socre # nice

Chinese.new.socre # NoMethodError: undefined method ‘socre’ for #<Chinese:0xde785>

當你有很多類別時, 且需要相同函數時, 就可以把函数定義到module中, 進行include。

extend與include是一個增加的是實體方法，另一個是類別方法。
