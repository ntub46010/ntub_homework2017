```ruby
#此程式作用為
#計算這名顧客這筆交易借出的電影以及租金
#並且統計所有電影的租金總額
#最後提示此交易獲得的紅利點數

#此程式可用於開立收據

class Customer		#定義一個類別Customer
			#用來定義Customer的各項屬性				

  attr_reader :name	#可直接讀取name變數

  def initialize(name)	#為name設置初始值,預設rentals為空陣列
    @name    = name
    @rentals = []
  end

  def add_rental(arg)	#增加內容至rentals陣列中
    @rentals << arg
  end

  def statement		#宣告statement方法
			#作用為根據電影的分級做差別處理
			#而計算價格
			#並且計算紅利點數
			#最後回傳結果

    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"		

    @rentals.each do |element|		#將rentals陣列中的每一個元素提出至element
      this_amount = 0
      case element.movie.price_code	#將rentals的各個元素中的movie.price_code做多重選擇
      when Movie::REGULAR		#當movie.price_code為0時做以下運算
	this_amount += 2
	this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE		#為1時做以下運算
	this_amount += element.days_rented * 3
      when Movie::CHILDRENS		#為2時做以下運算
	this_amount += 1.5
	this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      frequent_renter_points += 1	#frequent_renter_points增加 1 
      
      #檢查movie.price_code是否為 NEW_RELEASE 以及days_rented是否大於 1 
      #同時成立時frequent_renter_points增加 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1	      
	frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"	
      #改寫為  result += "\t#{element.movie.title}\t#{this_amount}\n"	 應該為同樣的效果
      
      total_amount += this_amount
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result		#回傳result

  end
end

####

class Movie		#定義一個類別Movie
			#用來定義Movie的各項屬性

  REGULAR     = 0	#設三個常數
  NEW_RELEASE = 1	#用來做電影的歸類
  CHILDRENS   = 2

  attr_reader :title			#可直接讀取title變數
  attr_accessor :price_code		#可直接對price_code做讀取及修改

  def initialize(title, price_code)	#為title及price_code設置初始值
    @title, @price_code = title, price_code
  end
end

####

class Rental	#定義一個類別Rental
		#用來定義Rental的各項屬性

  attr_reader :movie, :days_rented		#可直接讀取movie, days_rented變數

  def initialize(movie, days_rented)		#為movie及days_rented設置初始值
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie')			#宣告一個client物件, 型態為Customer並設定name初始值為eddie

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)	#宣告一個movie1物件, 型態為Movie並設定title初始值為ruby, price_code為 1
rental1 = Rental.new(movie1, 3)			#宣告一個rental1物件, 型態為Rental並設定movie初始值為movie1, days_rented 為 3
client.add_rental rental1			#使用add_rental方法將rental1置入client物件中的rentals陣列中

movie2 = Movie.new('php', Movie::REGULAR)	#宣告一個movie2物件, 型態為Movie並設定title初始值為php, price_code為 0
rental2 = Rental.new(movie2, 7)			#宣告一個rental2物件, 型態為Rental並設定movie初始值為movie2, days_rented 為 7
client.add_rental rental2			#使用add_rental方法將rental2置入client物件中的rentals陣列中

puts client.statement 

#####輸出結果

# Rental Record for eddie
	# ruby	9
	# php	9.5
# Amount owed is 18.5
# You earned 3 frequent renter points
```
