class Customer
  #屬性宣告
  attr_reader :name
  # 建立物件後先做的事
  def initialize(name)
    @name    = name
    @rentals = []
  end
  # 將arg加到rentals中
  def add_rental(arg)
    @rentals << arg
  end
  # 列出租借狀態
  def statement
	#總金額
    total_amount = 0
	#紅利點數
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"
	# 將rentals轉出來
    @rentals.each do |element|
      this_amount = 0
      #根據price_code給予不同的金額
      case element.movie.price_code
      when Movie::REGULAR #普遍級?
      	#基本2元
        this_amount += 2
		#如果租兩天以上,多租一天多1.5元
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE #新上市
		#1天3元
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS # 兒童
		#基本1.5元
		this_amount += 1.5		
        #如果租三天以上,多租一天多1.5元
	this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end
      #紅利點數+1
      frequent_renter_points += 1
      #如果借的是新上市 , 而且借1天以上 , 再加1紅利點數
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end
	  #將資訊加到result
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
	  #將金額加到總金額
      total_amount += this_amount
    end
	#列出總金額
    result += "Amount owed is #{total_amount}\n"
	#列出紅利
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end

####

class Movie
  #影片類型
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2
  #屬性宣告
  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end

####

class Rental
  #屬性宣告
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####
#建立一個名為eddie的Customer物件
client = Customer.new('eddie')
#建立一個名為ruby,類型為NEW_RELEASE的影片物件
movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
#建立一個租借ruby影片3天的"租借"物件
rental1 = Rental.new(movie1, 3)
#將"租借"物件加到剛剛建立的Customer裡
client.add_rental rental1

#新增第2個"租借"物件
movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

#列出Customer的租借狀態
puts client.statement


#這是一個可以看你租借資訊的功能
#可以看你租幾天要多少錢,以及紅利點數
