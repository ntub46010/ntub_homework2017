

############################宣告類別{Customer}############################

class Customer
  attr_reader :name #name全域變數 可讀可寫

  def initialize(name)	#宣告Class時 使用name，並執行以下動作
    @name    = name #把值放入 	@name全域變數
    @rentals = []	#宣告 		@rentals全域陣列
  end

  def add_rental(arg)
    @rentals << arg	#把arg值放入 	@rentals全域陣列
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n" #印出 	@rentals全域陣列

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


############################宣告類別{Movie}############################

class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title	#title全域變數 可讀
  attr_accessor :price_code	#price_code全域變數 可讀可寫

  def initialize(title, price_code)	#宣告Class時 使用title, price_code，並執行以下動作
    @title, @price_code = title, price_code	#將值放入	@title, @price_code 全域變數
  end
end

############################宣告類別{Rental}############################

class Rental
  attr_reader :movie, :days_rented	#movie, days_rented全域變數 可讀

  def initialize(movie, days_rented) #宣告Class時 使用movie, days_rented，並執行以下動作
    @movie, @days_rented = movie, days_rented #將值放入	@movie, @days_rented 全域變數
  end
end

####

client = Customer.new('eddie')	#Customer類別中 @name="eddie" @rentals = []

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)	#Customer類別中 @title="ruby" @price_code = 1
rental1 = Rental.new(movie1, 3)	#Rental類別中 @movie="ruby" @days_rented = 3
client.add_rental rental1	#rentals = [3]

movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)	#Rental類別中 @movie="php" @days_rented = 7
client.add_rental rental2	#rentals = [3,7]

puts client.statement	#執行statement方法
