class Customer
  attr_reader :name

  def initialize(name)  #定義方法initialize
    @name    = name  #name為實例變數
    @rentals = []   #rentals是陣列
  end

  def add_rental(arg) #定義方法add_rental
    @rentals << arg   #把arg值新增到rentals
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|  #|element| 是區域變數
      this_amount = 0  #設初值
      case element.movie.price_code   #Movie有三種類別：REGULAR、NEW_RELEASE、CHILDRENS符合哪個執行哪個
      when Movie::REGULAR #當電影類型為一般電影
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2  #若借片天數 > 2 就執行(element.days_rented - 2) * 1.5
      when Movie::NEW_RELEASE #當電影類型為新發行電影
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS #當電影類型為兒童電影
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3  #若借片天數 > 3 就執行(element.days_rented - 3) * 1.5
      end

      frequent_renter_points += 1 
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1  #若Movie是NEW_RELEASE 及 借片天數 > 1，frequent_renter_points再+1
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"  #把電影名稱跟轉成字串的this_amount丟入result裡
      total_amount += this_amount  #加總所有this_amount
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result  #result顯示上面兩行
  end
end

####

class Movie  #宣告類別Movie
  REGULAR     = 0  #設定初值
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title  #宣告屬性title只可讀
  attr_accessor :price_code #宣告屬性price_code可讀可寫

  def initialize(title, price_code)  #初始化 title 和 price_code
    @title, @price_code = title, price_code
  end
end

####

class Rental  #宣告類別Rental
  attr_reader :movie, :days_rented #宣告屬性movie與days_rented只可讀

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #建立變數client為類別Customer，賦予name為eddie

movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #建立變數 movie1 為類別 Movie ，賦予 title 為 ruby ， price_code 為 NEW_RELEASE
rental1 = Rental.new(movie1, 3) #建立變數 rental1 為類別 Rental ，賦予 movie 為 movie1 ， days_rented 為 3
client.add_rental rental1 #讓類別為 Customer 的 client 呼叫 add_rental 方法，傳入參數 rental1

movie2 = Movie.new('php', Movie::REGULAR)  #建立變數 movie2 為類別 Movie ，賦予 title 為 php ， price_code 為 REGULAR
rental2 = Rental.new(movie2, 7)  #建立變數 rental2 為類別 Rental ，賦予 movie 為 movie2 ， days_rented 為 7
client.add_rental rental2  #讓類別為 Customer 的 client 呼叫 add_rental 方法，傳入參數 rental2

puts client.statement
