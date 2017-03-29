class Customer
  attr_reader :name
  

  def initialize(name)
    @name    = name
    @rentals = []
  end
  #2. eddie輸入到name內存起來

  def add_rental(arg)
    @rentals << arg
  end
  #8.把arg裡的內容丟到@rentals

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

#宣告this_amount=0 
#判斷式

#現在狀態是 Movie::NEW_RELEASE 
#所以days_rented=3 this_amount=3*3=9
#frequent_renter_points=1 狀態是Movie::NEW_RELEASE 
#element.days_rented大於1 frequent_renter_points=2

#現在狀態是 Movie::REGULAR
#所以days_rented=7 this_amount=2 element.days_rented大於2 this_amount=(7-2)*1.5+2=9.5
#frequent_renter_points=2+1=3 狀態是Movie::REGULAR 不執行if
#total_amount=9+9.5=18.5

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
 #4.將參數存到title, price_code裡

####

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end
 #6.將參數存到movie, days_rented裡

####

client = Customer.new('eddie')  
#1.把Customer類別實體化 

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
#3.把Movie類別實體化

rental1 = Rental.new(movie1, 3)
#5.把Rental類別實體化 
client.add_rental rental1
#7. 呼叫add_rental發法 

movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement

#計算租借影片點數 有分新發行、已發行、兒童租片
