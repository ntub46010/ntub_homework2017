# 作業005

class Customer #客戶的資料存取
  attr_reader :name 
  
  def initialize(name) #定義客戶姓名和出租陣列
    @name    = name
    @rentals = []
  end

  def add_rental(arg) #所新增出租項目
    @rentals << arg
  end

  def statement #帳單計算
    total_amount = 0 #初始值
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element| #判斷出租片子的總額
      this_amount = 0 
      case element.movie.price_code
      when Movie::REGULAR #經常被借的片子先加2點超過借期兩天的，將天數-2 X 1.5算進點數
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE #新上映的片子點數直接天數 X 3點
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS #兒童的片子先加1.5點，若大於3 天的，將天數-3 X 1.5
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      frequent_renter_points += 1 #每借一部加一點紅利
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1 #如果是新片又大於一天借期再加 1 點
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n" #計算所借的片子和計算總額
      total_amount += this_amount
    end

    result += "Amount owed is #{total_amount}\n" #輸出總額和片名
    result += "You earned #{frequent_renter_points} frequent renter points" #輸出紅利點數
    result
  end
end

####

class Movie #Movie的類別讀取新的實體 (名字和價碼)
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title #讀去片名標題
  attr_accessor :price_code #讀取加設定價格

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end

####

class Rental #Rental類別讀取借閱天數實體
  attr_reader :movie, :days_rented #讀取movie 和借閱天數

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #新增eddie客戶的資料

movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #借了ruby 新上市
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::CHILDRENS) #借了php 小孩的書
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement #輸出客戶帳單
