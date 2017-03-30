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
  #定義一個Movie類別
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2
  #REGULAR為0
  #NEW_RELEASE為1
  #CHILDRENS為2
  attr_reader :title
  #可以讀取 :title
  attr_accessor :price_code
  #可讀取+設定 :price_code
  def initialize(title, price_code)
    @title, @price_code = title, price_code
    #定義一個有初始值的 title，price_code方法
    #@title=title
    #@price_code=price_code
  end
end

####

class Rental
#定義一個 Rental類別
  attr_reader :movie, :days_rented
  #可讀取 :movie
  #可讀取 :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
    #定義一個有初始值的 movie，days_rented方法
    #@movie=movie
    #@days_rented=days_rented
  end
end

####

client = Customer.new('eddie')
movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

=begin
 用Customer類別的new方法產生一個實體，叫做client @name='eddie'
 用Movie類別的new方法產生一個實體，叫做movie1 @title='ruby' ，因為@price_code為Movie::NEW_RELEASE，所以this_amount=element.days_rented*3
 用Rental類別的new方法產生一個實體，叫做rental1 @movie=movie1 days_rented=3
 而this_amount 的初始值為 0
 所以this_amount=0+3*3=9
 在呼叫client.add_rental方法 參數arg=9，將9放入@rentals陣列
=end


movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

=begin
 用Movie類別的new方法產生一個實體，叫做movie2 @title='php' ，因為@price_code為 Movie::REGULAR，所以this_amount+2
 然後如果element.days_rented>2，那this_amount=(element.days_rented-2)*1.5
 用Rental類別的new方法產生一個實體，叫做rental2 @movie=movie2 days_rented=7
 而this_amount 的初始值為 0
 所以this_amount=0+2=2，然後因為days_rented=7 > 2，所以this_amount+=(element.days_rented-2)*1.5，所以2+(7-2)*1.5=9.5
 在呼叫client.add_rental方法 參數arg=9.5，將9.5放入@rentals陣列
=end

puts client.statement

=begin
 用puts印出client.statement
 而statement方法，total_amount=0，frequent_renter_points=0，result="Rental Record for #{@name}\n"
 所以result=Rental Record for eddie
 而this_amount=0，然後rental因為是Movie::NEW_RELEASE，所以@rentals=9，執行完接著執行 frequent_renter_points += 1，所以frequent_renter_points=1
 然後if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1，此為true，所以執行frequent_renter_points += 1，frequent_renter_points=2
 result=\t" + element.movie.title + "\t" + this_amount.to_s + "\n，所以為 ruby 9
 total_amount += this_amount，所以total_amount=9
 然後movie2因為是Movie::REGULAR，所以@rentals=9.5，執行完接著執行frequent_renter_points += 1，所以frequent_renter_points=3
 然後if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1，此為false，所以不執行
 result=\t" + element.movie.title + "\t" + this_amount.to_s + "\n，所以為 php 9.5
 total_amount += this_amount，所以total_amount=9+9.5=18.5
 在執行"Amount owed is #{total_amount}\n"，所以為Amount owed is 18.5
 在執行You earned #{frequent_renter_points} frequent renter points，所以為You earned 3 frequent renter points
 最後回傳傳result

 所以最後puts結果為
 Rental Record for eddie
  ruby 9
  php  9.5
 Amount owed is 18.5
 You earned 3 frequent renter points
=end
