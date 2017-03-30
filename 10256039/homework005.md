# 作業 005

### 程式
```ruby
class Customer
  attr_reader :name

  def initialize(name)
    @name    = name
    @rentals = []
  end

  def add_rental(arg)  # 新增出租紀錄
    @rentals << arg
  end

  def statement  # 結算
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

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

      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end

####

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

####

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

### 程式說明
這是一支影片出租的程式，最後會輸出租借的影片單價，總價格以及點數

價格計算方式：
* REGULAR -> 兩天以下 (含) 2 元，第三天開始每天 1.5 元
* NEW_RELEASE -> 一天 3 元
* CHILDRENS -> 三天以下 (含) 1.5 元，第四天開始每天 1.5 元

點數計算方式：租一部片一點，如果租的是新片 (NEW_RELEASE) ，若租一天以上加贈一點

### 輸出結果
```
Rental Record for eddie
	ruby 9
	php  9.5
Amount owed is 18.5
You earned 3 frequent renter points
```
