# 作業005
我的註解沒有很多，基本觀念就沒有特別註解，覺得有必要的部分才註解
```ruby
#客戶類別
class Customer
  attr_reader :name #可以讀取name
  
  # 初始化設定(將收到的參數放入實體變數name中,並將實體變數rentals設為一個空陣列)
  def initialize(name)
    @name    = name
    @rentals = []
  end
  
  #新增租金(把收到的參數放入實體變數rentals這個陣列)
  def add_rental(arg)
    @rentals << arg
  end
  
  #查看狀態
  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"  #插入Customer類別的實體變數name的值
    
    #把租金做處理
    #條件如下
    #先將this_amount預設為0
    #以租金類別下的電影類別裡的price_code的值拿來判斷
    
    #(請問老師一般在業界會解釋以下這些嗎？)
    #若與電影類別下的REGULAR常數相等(0),則將this_amount先設為2,並判斷租金類別下的days_rented的值是否大於2,
    #若是則days_rented先減2再乘上1.5,最後將this_amount加上結果的值
    
    #若與電影類別下的NEW_RELEASE常數相等(1),則將days_rented*3,最後將this_amount加上結果的值
    
    #若與電影類別下的CHILDRENS常數相等(2),則將this_amount先設為1.5,並判斷租金類別下的days_rented的值是否大於3,
    #若是則days_rented先減2再乘上1.5,最後將this_amount加上結果的值
    
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
      #先將frequent_renter_points加1
      #如果租金類別下的電影類別裡的price_code與電影類別裡的常數NEW_RELEASE相等
      #並且租金類別下的days_rented大於1
      #則將frequent_renter_points再加1
      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end
      #印出結果並將total_amount加上結果
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end

###
#電影類別
#建立了三個常數 給予預設值
class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end

###
#租金類別
class Rental
  attr_reader :movie, :days_rented
  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie')
movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement
```
