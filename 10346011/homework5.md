class Customer  
  attr_reader :name

  def initialize(name) 
    @name    = name 
    @rentals = []   
  end

  def add_rental(arg)  #定義add_rental方法
    @rentals << arg  #將arg的參數附加進rentals陣列裡
  end

  def statement
    total_amount = 0   #預設租片金額=0
    frequent_renter_points = 0  #預設租片累積點數=0
    result = "Rental Record for #{@name}\n"  #字串result="Rental Record for 客戶姓名

    @rentals.each do |element|  #計算租金
      this_amount = 0
      case element.movie.price_code
      when Movie::REGULAR
        this_amount += 2 #一般片子每部租金2塊
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2 #一般片子超過兩天，每部片子多1.5塊
      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3  #新片價錢，一天3塊
      when Movie::CHILDRENS
        this_amount += 1.5 #兒童片每部1.5塊
        this_amount += (element.days_rented - 3) * 1.5 if   element.days_rented > 3  #兒童片超過三天，每部多1.5塊
      end

      frequent_renter_points += 1 #租片累積點數+1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1 #如果是租新片又超過一天，增加1點累積點數
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"  #把每部片子名稱以及租金加入result陣列
      total_amount += this_amount  #累積全部租金
    end

    result += "Amount owed is #{total_amount}\n" #把欠款租金加入result陣列
    result += "You earned #{frequent_renter_points} frequent renter points"  #把累積點數加入result陣列
    result
  end
end

####

class Movie #影片分類
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

class Rental  #管理影片出租天數
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie')  #新增客戶(名稱：eddie)

movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #新增影片(名稱ruby，影片分類-新片)
rental1 = Rental.new(movie1, 3) #出租天數(3)
client.add_rental rental1  #寫入陣列

movie2 = Movie.new('php', Movie::REGULAR)  #新增影片(名稱php，影片分類-一般)
rental2 = Rental.new(movie2, 7) #出租天數(7)
client.add_rental rental2  #寫入陣列

puts client.statement  #輸出顧客的紀錄
