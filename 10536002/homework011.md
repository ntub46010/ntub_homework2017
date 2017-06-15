1.	請用「自己的話」舉例說明什麼叫做「Duck Typing」


當我看到一隻鳥，它走路像鴨子，游泳像鴨子，叫聲像鴨子，我就稱其為鴨子。
當某個傳進來的物件具有特定方法就可以，例如鴨子會呱呱叫，如果有老鷹也會呱呱叫，就可以把老鷹當作鴨子。


	class Duck
	    def quack 
		print "呱呱呱"
	    end
	    def sleep(self): 
		print "ZZZ"
	    end
	end	
	
	class Person
	    def quack	    
		print "哇哇哇"		
	    end	    
	    def sleep(self): 
		print "ZZZ"	
	    end		
	end
		
	def in_the_forest(duck)
	    duck.quack()	    
	    duck.sleep()
	end

	donald = Duck()
	john = Person()	
	in_the_forest(donald)
	in_the_forest(john)
	
 
2.	請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。

class method就像是我有一個動物類別其中有一個方法叫做溜動物，不會只限定溜哪個動物，instance method 我會時做一個貓的動物他有一個方法也叫溜動物，此時溜的動物就只有貓。

	\# 以class mehtod為主 
	class Greeting
	    def self.hello(name)
	        "Hello, #{name}" 
	    end 
	end 
	
	# 實際執行 
	Greeting.hello "John" 


	# 以instance method為主 
	class Greeting 
	    def initialize(name)
	        @name = name 
	    end 
	    def hello
	        "Hello, #{@name}" 
	    end
	end
	    
	# 實際執行 
	greeting = Greeting.new("John") 
	greeting.hello
	
 
3.	在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？

include是讓這個class所產生的instance繼承module中的method，extend則是讓這個class具有module中的method，卻不會繼承給instance

	module Foo
	    def foo
		puts 'hello!'   
	    end
	end 

	class Bar   
	    include Foo 
	end 
	Bar.new.foo # hello! 
	Bar.foo # NoMethodError 

	class Baz   
	    extend Foo 
	end 
	Baz.foo # hello! 
	Baz.new.foo # NoMethodError
