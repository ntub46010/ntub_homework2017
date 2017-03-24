class Customer
  attr_reader :name

  def initialize(name) #設定初始化名稱
    @name    = name
    @rentals = []    #宣告空陣列
  end

  def add_rental(arg) 
    @rentals << arg # 把arg放在陣列reatls裡
  end

  def statement
    total_amount = 0   
    frequent_renter_points = 0 
    result = "Rental Record for #{@name}\n" #宣告自傳為= rental+前面的name值 
   
   @rentals.each do |element|   #@rental底下每一行都執行 , 設定初始執amount=0,進入case判斷式 判斷element.movie,price.code 
      this_amount = 0
      case element.movie.price_code
      when Movie::REGULAR     #如果element.movie,price.code是regulaar 執行下面程式  
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE  #如果element.movie,price.code是new_release 執行下面程式 
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS   #如果element.movie,price.code是children 執行下面程式 
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      frequent_renter_points += 1  #frequent_renter_points 遞增1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1 #判斷element.movie.price_code == Movie::NEW_RELEAS跟element.days_rented作and運算   
        frequent_renter_points += 1   #如果>1 frequent_renter_points遞增1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"  # 一個叫result的字串
      total_amount += this_amount
    end

    result += "Amount owed is #{total_amount}\n"                  #在前面的result字串後面+上這行的字串
    result += "You earned #{frequent_renter_points} frequent renter points" #在前面倆個合併起來的result字串後面加上這行字串
    result
  end
end

####

class Movie               # 設定一個叫movie的class類別,在裡面設定regular,new_release,children,attr_reader,attr_accessor的參數
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)  #定義一個initialize回傳參數值是,title,price_code 的方法
    @title, @price_code = title, price_code
  end
end

#### 
class Rental                     #宣告一個叫rental的類別,設定attr_reader的參數
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)  #定義一個initialize回傳參數是movie, days_rente參數的方法
    @movie, @days_rented = movie, days_rented #宣告@movie =movie , @days_rented=days_rented
  end
end

####

client = Customer.new('eddie')               #新增一個客戶名子 eddie
movie1 = Movie.new('ruby', Movie::NEW_RELEASE)  #新增一個名叫ruby的電影,等級是new_release
rental1 = Rental.new(movie1, 3)       #新增一個title是moviel, days_rented是3
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR) #新增一個名叫php的電影,等級是regular
rental2 = Rental.new(movie2, 7)   #新增一個title是movie2, days_rented是7
client.add_rental rental2

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement  # 印出 client.statement
