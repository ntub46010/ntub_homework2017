class Customer 
  attr_reader :name #建一個名為attr_reader的Symbol
  
  def initialize(name) #建一個初始化方法，並設@name實體變數與@rentals的陣列
    @name    = name
    @rentals = []
  end

  def add_rental(arg) #此方法將arg參數 賦予給@rentals實體變數
    @rentals << arg
  end

  def statement #此方法將計算租金與點數
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element| #記錄不同租借方案的租金
      this_amount = 0
      case element.movie.price_code
      when Movie::REGULAR  #如果是普通片租金+2，(租的天數-2)*1.5
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE # 如果是新片就是租的天數*3
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS #如果是兒童片租金+1，(租的天數-3)*1.5
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      frequent_renter_points += 1 #計算租借的點數，每租一部片+1點，如果是新顧客且租的天數大於1的話在+1點
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n" #輸出電影名稱與租金
      total_amount += this_amount #輸出總租金
    end

    result += "Amount owed is #{total_amount}\n" #顯示目前所要付的{錢}
    result += "You earned #{frequent_renter_points} frequent renter points" # 顯示目前你賺取的{點數}
    result
  end
end

####

class Movie #建Movie類別，並給賦予這三種片代號，並利用Symbol供外部存取
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

class Rental #建租金類別，利用Symbol供外部存取電影租借天數
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #新增顧客物件
movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #第一次租借的電影為ruby且為新片
rental1 = Rental.new(movie1, 3) #租三天
client.add_rental rental1  #把上面資訊加入到顧客物件裡

movie2 = Movie.new('php', Movie::REGULAR) #租第二片，一般片
rental2 = Rental.new(movie2, 7) #租七天
client.add_rental rental2  #把上面資訊加到顧客物件裡
puts client.statement #顯示顧客的租借的金額、天數與賺取的點數
#####
總之這一長串程式碼可以提供顧客租借電影，並記錄顯示顧客租借的金額與天數，並回饋顧客點數，也許集8點可免費租借一部片吧?
