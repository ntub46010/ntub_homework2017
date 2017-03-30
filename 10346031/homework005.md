class Customer
  attr_reader :name ##可存取姓名
  def initialize(name) ##初始化姓名
    @name    = name
    @rentals = []  ##指定rentals為空集合 (顧客租借紀錄)
  end

  def add_rental(arg)
    @rentals << arg  ##將租借事件新增至rentals (顧客租借紀錄)
  end

  def statement
    total_amount = 0  ##初始化總收費金額
    frequent_renter_points = 0  ##初始化租片累積點數
    result = "Rental Record for #{@name}\n" ##租借內容  "本次租借者為#@{name}"
    
    @rentals.each do |element|
      this_amount = 0  ##本次收費總額
      case element.movie.price_code 
      when Movie::REGULAR
        this_amount += 2   ##一般片租金為2元 租超過2天 每日追加1.5元
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3 ##新片租金計價為日期乘上3
      when Movie::CHILDRENS
        this_amount += 1.5  ##兒童片租金為1.5元 租超過3天 每日追加1.5元
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      frequent_renter_points += 1  ##增加1點租片累積點數
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1  ##若租片類型為：新片  則每日增加1點 租片累積點數
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"   ##輸出本次租借的電影名稱和租金
      total_amount += this_amount   ##累積至總租金
    end

    result += "Amount owed is #{total_amount}\n"  ##新增欠款總額 至result內
    result += "You earned #{frequent_renter_points} frequent renter points"  ##新增本次租借所獲得的 租片累積點數 至result內
    result  ##puts本次租借內容
  end
end

####

class Movie  ##電影分類
##影片分級的代號
  REGULAR     = 0  ##一般==0
  NEW_RELEASE = 1  ##新片==1
  CHILDRENS   = 2  ##兒童片==2
  
  attr_reader :title ##可存取名稱
  attr_accessor :price_code ##可供外部存取代號
  
  def initialize(title, price_code)
    @title, @price_code = title, price_code  ##回傳名稱及代號
  end
end

####

class Rental  ##租借分類
  attr_reader :movie, :days_rented  ##可存取電影及租借天數
  
  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented  ##回傳電影及租借天數
  end
end

####

client = Customer.new('eddie')  ##建立一新客戶  名 "eddie"
movie1 = Movie.new('ruby', Movie::NEW_RELEASE)  ##eddie客戶租借一部新片  名為ruby
rental1 = Rental.new(movie1, 3) ##eddie租借ruby影片 天數為3天
client.add_rental rental1  ##將該事件寫入顧客紀錄中

movie2 = Movie.new('php', Movie::REGULAR)  ##eddie客戶租借一部一般片  名為php
rental2 = Rental.new(movie2, 7)  ##eddie租借php影片 天數為7天
client.add_rental rental2  ##將該事件寫入顧客租借紀錄中

puts client.statement  ##puts客戶租借紀錄
