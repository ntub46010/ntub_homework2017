#影片出租程式，可以將不同客戶的租借天數與紀錄放進不同的陣列，然後分別做計算，算出該客戶租借明細與獲得的點數，並做格式化輸出。

class Customer #負責運算客戶租借明細
  attr_reader :name

  def initialize(name) #建立顧客姓名與租借資訊的陣列
    @name    = name
    @rentals = []
  end

  def add_rental(arg) #將新一筆的租借資訊加入陣列
    @rentals << arg
  end

  def statement
    total_amount = 0 #欠款總金額
    frequent_renter_points = 0 #會員點數
    result = "Rental Record for #{@name}\n" #預設輸出的字串

    @rentals.each do |element| #因為有兩筆紀錄 所以執行兩次迴圈
      this_amount = 0 #單筆影片的租借金額
      case element.movie.price_code #判斷租借影片的類別
      when Movie::REGULAR
        this_amount += 2  #2天以內金額2元
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2 #如果租超過2天就會先減掉2天再乘1.5的金額
      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS
        this_amount += 1.5  #3天以內金額1.5元
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3 #如果租超過3天就會先減掉3天再乘1.5的金額
      end

      frequent_renter_points += 1 #會員點數加1點
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1 #如果是新片，並且租超過1天就會再送1點會員點數
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n" #將單筆影片明細加進字串中
      total_amount += this_amount #增加欠款總金額
    end

    result += "Amount owed is #{total_amount}\n" #將欠款總金額加進字串中
    result += "You earned #{frequent_renter_points} frequent renter points" #將獲得的會員總點數加進字串中
    result
  end
end

####

class Movie #主要負責影片管理的類別
  REGULAR     = 0 #一般影片
  NEW_RELEASE = 1 #新片
  CHILDRENS   = 2 #兒童片

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end

####

class Rental #主要負責租借紀錄的類別
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #建立顧客eddie

movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #建立租借ruby的紀錄 並登記影片類別
rental1 = Rental.new(movie1, 3) #記錄出租movie1的天數
client.add_rental rental1 #將rental1的資訊加進陣列

movie2 = Movie.new('php', Movie::REGULAR) #建立租借php的紀錄
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement
