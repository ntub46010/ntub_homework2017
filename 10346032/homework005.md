class Customer 	 #定義Customer類別

  attr_reader :name 	#讀取name
  
  def initialize(name) 	#定義有初始值name的方法
  
    @name    = name  	#實體變數
    
    @rentals = []     	#實體變數的陣列
    
  end

  def add_rental(arg)       
   @rentals << arg
  end	
	
	
  
  ==begin
  定義add_rental方法設arg為參數，並把arg丟入@rentals實體變數陣列
	==end
 
 
 
 
 
 def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      this_amount = 0
      case element.movie.price_code
      when Movie::REGULAR
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end


 ==begin
	
	 定義statement方法
	 設定total_amount、frequent_renter_points區域變數=0
	 設定result="Rental Record for @name"
	 
	 @rentals陣列讀出，以element代入
	 
	 設定this_amount=0
	 以element.movie.price_code的判斷，
	 如果是Movie::REGULAR，則this_amount+2,並判斷如果element.days_rented大於2，就把this_amount=this_amount+(element.days_rented-2)*1.5
	 如果是Movie::NEW_RELEASE，則this_amount=this_amount+element.days_rented*3
	 如果是Movie::CHILDRENS，則this_amount+1.5,並判斷如果element.days_rented大於3，就把this_amount=this_amount+(element.days_rented-3)*1.5
	 
	 frequent_renter_points=frequent_renter_points+1
	 
	 判斷element.movie.price_code是否等於Movie::NEW_RELEASE且element.days_rented > 1
	 如果是，frequent_renter_points=frequent_renter_points+1
	 
	 result=result+"\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
	 total_amount=total_amount+this_amount
	 
	 result=result+"Amount owed is #{total_amount}\n" "You earned #{frequent_renter_points} frequent renter points"
	 
	 
==end



####

class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end


==begin
	定義Movie類別
	設定REGULAR=0,NEW_RELEASE=1,CHILDRENS=2
	讀取title
	讀取並寫入price_code
	
	定義有初始值的方法並帶有參數title,price_code
	設定實體變數title,price_code=參數title,price_code
	
==end

####

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

==begin
	定義Rental類別
	讀取:movie,:days_rented
	
	定義有初始值的方法，並帶有參數movie,days_rented
	設定實體變數movie,days_rented=參數movie,days_rented
	
	==end

####

client = Customer.new('eddie')

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement
==begin
	client=呼叫Customer類別並代入參數eddie
	
	movie1=呼叫Movie類別並代入參數('ruby',Movie::NEW_RELEASE)
	rental1=呼叫Rental類別帶入變數(movie1,3)
	把rental1的紀錄加進client裡面
	
	movie2=呼叫Movie類別並代入參數('ruby',Movie::NEW_REGULAR)
	rental2=呼叫Rental類別帶入變數(movie2,7)
	把rental2的紀錄加進client裡面
	
	輸出client狀態
	
	==end
