class Customer
  attr_reader :name

  def initialize(name) #顧客由名字、所有租借事件組成
    @name    = name
    @rentals = [] #租借事件的集合
  end

  def add_rental(arg)
    @rentals << arg #將租借事件附加到集合
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n" #待輸出的租借紀錄

    @rentals.each do |element|
      this_amount = 0
      case element.movie.price_code #根據租借天數及price_code來計算amount
      when Movie::REGULAR
        this_amount += 2 #基本amount為2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2 #租超過2天，每日追加1.5
      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3 #amount為租借天數*3
      when Movie::CHILDRENS
        this_amount += 1.5 #基本amount為1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3 #租超過3天，每日追加1.5
      end

      frequent_renter_points += 1 #points加1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1 #NEW_RELEASE的電影租超過1天則再加1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n" #輸出附加該次電影名稱和amount
      total_amount += this_amount #累積該次amount
    end

    #輸出附加總amount和該次frequent renter points
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result #輸出整個租借紀錄
  end
end

####

class Movie
  #定義三個price_code
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code) #電影物件由電影名稱、price_code組成
    @title, @price_code = title, price_code
  end
end

####

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented) #租借事件由電影物件、租借天數組成
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #建立名叫eddie的顧客

movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #建立一個電影物件
rental1 = Rental.new(movie1, 3) #建立一個電影租借事件，租3天
client.add_rental rental1 #將該租借事件寫入顧客中

#第二次租借
movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

#顯示顧客租借紀錄
puts client.statement
