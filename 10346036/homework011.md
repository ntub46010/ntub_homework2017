1.請用「自己的話」舉例說明什麼叫做「Duck Typing」。
Duck Typing是可接受不同型態的物件呼叫它的方法。
class Bird
    def say
        puts "I'm a bird."
    end
    def call(bird)
        bird.say
    end
end
class Eagle < Bird
    def say
        puts "I'm an eagle, inherit of bird."
    end
end
#I'm a bird.
#I'm an eagle, inherit of bird.
透過bird.call方法裡的bird.say，傳給Bird、Eagle不同的物件，產生了兩種不同的行為。

2.請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
差別在於方法作用的對象不同，實體方法需要一個實體物件才能呼叫，類別方法可直接用類別呼叫。
kitty = Cat.new("kitty", "female")
kitty.say_hello
say_hello是作用在kitty這個實體物件上，所以是實體方法。
class PostsController < ApplicationController
    def index
      @posts = Post.all
    end
end
all是作用在Post這個類別上，所以是類別方法。

3.在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
使用include將module的方法變成該類別的實例方法，需要建立實體物件呼叫。
使用extend是讓該類別擁有module中的方法，類別可以直接呼叫。
module Foo   
  def foo     
    puts 'hey!'   
  end 
end
class Bar   
  include Foo 
end 
class Baz   
  extend Foo 
end 
Bar.new.foo # hey!
#Bar.foo 因為沒有建立實體物件會發生錯誤。
Baz.foo # hey!
#Baz.new.foo 因為使用extend，module中的方法不會繼承給實體物件，這裡使用實體物件呼叫會發生錯誤。
