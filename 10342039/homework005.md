##本程式是紀錄顧客租借電影的電影名稱、租借天數、租借點數、應付總金額，
當新增一名顧客，並且建立該顧客租借之電影名稱、電影種類、租借天數的物件，
此程式會根據電影種類計算租借費用，而租借的電影是新上映且租借超過一天，顧客會獲得點數1點，
最後輸出顧客租借紀錄，依序為  顯示顧客名字、列示各個電影租借費用、應付租借總額、獲得點數。

----------
```ruby

class Customer #定義一個類別:顧客
  attr_reader :name #讀取顧客姓名
  
  def initialize(name)
    @name    = name #建立屬性:姓名
    @rentals = [] #建立屬性:租借紀錄
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount = 0 #總金額
    frequent_renter_points = 0 #租借後可獲得之點數
    result = "Rental Record for #{@name}\n" #某人的租借紀錄
    
    @rentals.each do |element|
      this_amount = 0
      case element.movie.price_code
      when Movie::REGULAR #普通片
        this_amount += 2 #租借之基本費用2元
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2 #如果租借天數>2,(租借天數-2)*1.5
      when Movie::NEW_RELEASE #新上映片
        this_amount += element.days_rented * 3 #租借天數*3
      when Movie::CHILDRENS #兒童片
        this_amount += 1.5 #租借之基本費用1.5元
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3 #如果租借天數>3,(租借天數-3)*1.5
      end

      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1 #如果影片為新上映電影，且租借天數>1天
        frequent_renter_points += 1 #獲得點數1點
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n" #輸出此"電影名稱"與"租金金額"
      total_amount += this_amount #累加租借電影的租金金額，輸出總租金金額
    end

    result += "Amount owed is #{total_amount}\n" #輸出"應付總金額"
    result += "You earned #{frequent_renter_points} frequent renter points #" 輸出"你獲得?點數"
    result
  end
end

####

class Movie #定義類別─電影
  REGULAR     = 0 #普通片
  NEW_RELEASE = 1 #新上映片
  CHILDRENS   = 2 #兒童片
  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code #建立屬性─電影名稱(標題)、代碼
  end
end

####

class Rental #定義類別─租借紀錄
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented # #建立屬性─電影、租借天數
  end
end

####

client = Customer.new('eddie')#新增一名叫"Eddie"的顧客物件
movie1 = Movie.new('ruby', Movie::NEW_RELEASE)#新增一個"新上映電影─Ruby"的電影物件
rental1 = Rental.new(movie1, 3) # 新增"電影名稱"與"租借天數"的租借紀錄物件
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)#新增一個"普通片─php"的電影物件
rental2 = Rental.new(movie2, 7) #新增"電影名稱"與"租借天數"的租借紀錄物件
client.add_rental rental2

puts client.statement #印出顧客租借狀況
