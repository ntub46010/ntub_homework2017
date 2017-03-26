class Customer
  attr_reader :name
#宣告一個類別Customer，讀取name

  def initialize(name) 
    #定義有初始值的name方法
    @name    = name 
    #實體變數
    @rentals = []   
    #實體變數的陣列
  end
  
  def add_rental(arg) 
    #定義一個add_rental的方法，參數是arg
    @rentals << arg   
    #將arg放到@rentals陣列裡
  end

  def statement     
    #定義一個statement方法
    total_amount = 0 
    #total_amount為0 
    frequent_renter_points = 0
    #frequent_renter_points為0
    result = "Rental Record for #{@name}\n"
    #result為字串Rental Record for 加上讀取的name值
    
    @rentals.each do |element| 
      #@rentals陣列裡的每個一個都去執行以下的程式碼，element是這個block裡專屬的區域變數
      this_amount = 0 #this_amount為0
      case element.movie.price_code
      when Movie::REGULAR
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
        
       #以Movie.price_code判斷，如果是Movie::REGULAR，則this_amount+2
       #如果element.days_rented>2，那this_amount=(element.days_rented-2)*1.5
      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3
       #以Movie.price_code判斷，如果為Movie::NEW_RELEASE，則this_amount=element.days_rented*3
      when Movie::CHILDRENS
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
       #以Movie.price_code判斷，如果為Movie::CHILDRENS，則 this_amount+1.5
       #如果element.days_rented>3，則this_amount=(element.days_rented - 3) * 1.5
      end

      frequent_renter_points += 1
      #frequent_renter_points+1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end
      #如果element.movie.price_code == Movie::NEW_RELEASE同時element.days_rented > 1，則frequent_renter_points+1
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      #結果為"\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
      #total_amount的值=total_amount的值加上this_amount的值
    end

    result += "Amount owed is #{total_amount}\n"
    #result=result+"Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    #result=result+"You earned #{frequent_renter_points} frequent renter points"
    result
    #return result
  end
end



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

####

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie')

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement
