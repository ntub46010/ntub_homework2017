# 作業 005
依照電影類別進行分類
計算客戶應付的租金與應得的點數

```ruby
class Customer #定義類別Customer
  attr_reader :name #name可以直接讀取
  def initialize(name) #初始化name
    @name    = name #收到的參數放到name中
    @rentals = [] #rentals是空陣列
  end

  def add_rental(arg) #新增租金
    @rentals << arg #把參數放到rentals陣列
  end

  def statement #看狀態
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

    #租金計算
    #Movie::REGULAR 一般電影每天2元
    #Movie::NEW_RELEASE 新上映的電影每天2元 超過2天要乘以1.5倍
    #Movie::CHILDRENS 兒童電影每天1.5元 超過3天要乘以1.5倍
    @rentals.each do |element| #把每個rentals裡的元素放到element
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

      #點數
      #租一天點數一點
      #如果是新上映電影可以再多拿到一點
      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    #印出結果
    result += "Amount owed is #{total_amount}\n" #租金多少
    result += "You earned #{frequent_renter_points} frequent renter points" #得到多少點數
    result
  end
end

####

class Movie #定義電影類別 預設三個常數
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title #直接讀取title
  attr_accessor :price_code #直接讀取和修改price_code
  def initialize(title, price_code) #初始化title和price_code
    @title, @price_code = title, price_code
  end
end

####

class Rental #定義類別
  attr_reader :movie, :days_rented #直接讀取
  def initialize(movie, days_rented) #初始化
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #宣告client物件 型態是Customer 初始值eddie
movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement
```
