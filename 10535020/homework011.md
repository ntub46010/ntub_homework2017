1.Duck typing:指的是helper,
舉例：

def display_name(candidate)

"#{candidate.name}(#{candidate.party})"

傳進來的值，不管是不是candidate都會做替換

2.實體方法是直接作用在實體上,舉例：

puppy = Dog.new("puppy","male")

puppy.say_hi

say_hi直接作用在puppy實體上

而類別方法,範圍較小，舉例：

def load

  @run=go.all
  
end

這個方法直接作用在go類別上

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

意思是說include在使用時是把module 的方法整個包含進去

而extend是種延展的概念，做延伸，不需要再產生類別
