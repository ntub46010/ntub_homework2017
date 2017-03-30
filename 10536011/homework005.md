#定義Customer類別
class Customer
  attr_reader :name #讀取顧客名子(name)
#initialize方法將參數傳進來給內部的實體變數@name和@rentals
  def initialize(name) 
    @name    = name
    @rentals = []
  end
#add_rental方法將得到的出借紀錄記到rentals陣列中
  def add_rental(arg)
    @rentals << arg
  end
#statement方法，計算各片所需支付多少租金以及累積點數，最後輸出結果該筆紀錄為哪個顧客、各片所需付租金、總需付租金、累積點數為多少
  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"
   #利用each迴圈將rentals內元素做運算
    @rentals.each do |element|
      this_amount = 0
      case element.movie.price_code
      when Movie::REGULAR #當片種為一般(Movie::REGULAR)的話租金為一天2元，若租借天數超過2天，則2天後以一天1.5元計算
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE #當片種為新片(Movie::NEW_RELEASE)的話租金為一天3元
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS #當片種為兒童片(Movie::CHILDRENS)的話租金為一天1.5元，若租借天數超過3天，則3天後以一天1.5元計算
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end
      #租一片電影累積點數加1點，若租的是新片且租超過1天，則多給1點
      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n" #結果->片名+該片所欠租金
      total_amount += this_amount #總欠款為總欠款+該片欠款
    end

    result += "Amount owed is #{total_amount}\n" #結果:總欠款為多少
    result += "You earned #{frequent_renter_points} frequent renter points" #你得到多少點數
    result #回傳result值
  end
end

####
#定義Movie類別，電影種類為三種:REGULAR、NEW_RELEASE、CHILDRENS
class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title #讀取電影名稱(title)
  attr_accessor :price_code #讀取和設定電影種類(price_code)
  
  def initialize(title, price_code) #initialize方法將參數傳進來給內部的實體變數@title和@price_code
    @title, @price_code = title, price_code
  end
end

####
#定義Rental類別
class Rental
  attr_reader :movie, :days_rented #讀取電影名稱(movie)和該片租金(days_rented)

  def initialize(movie, days_rented) #initialize方法將參數傳進來給內部的實體變數@movie和@pdays_rentend
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #使用Customer的new方法產生實體client

movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #使用Movie的new方法產生實體movie1
rental1 = Rental.new(movie1, 3) #使用rental的new方法產生實體rental1
client.add_rental rental1 #客戶此次產生租金放在rental1

movie2 = Movie.new('php', Movie::REGULAR) #使用Movie的new方法產生實體movie2
rental2 = Rental.new(movie2, 7) #使用rental的new方法產生實體rental2
client.add_rental rental2 #客戶此次產生租金放在rental1

puts client.statement #印出client的statement的回傳值
