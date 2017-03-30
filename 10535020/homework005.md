class Customer #定義Customer類別
  attr_reader :name #讀取name
  def initialize(name) #定義initialize方法
    @name    = name #name存入@name變數當中
    @rentals = [] #@rentals為空陣列
  end

  def add_rental(arg) #定義add_rental方法
    @rentals << arg #@rentals繼承arg
  end

  def statement 
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n" 
    @rentals.each do |element| 
      this_amount = 0
      case element.movie.price_code #選擇element.movie.price_code 
      when Movie::REGULAR #如果Movie是REGULAR則this_amount+2
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2 
        #如果element.days_rented(租借天數) > 2則this_amount等於(element.days_rented - 2) * 1.5
      when Movie::NEW_RELEASE #如果Movie是NEW_RELEASE 則 this_amount 為element.days_rented * 3
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS #如果Movie是CHILDRENS則this_amount+1.5
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
         #如果element.days_rented(租借天數) > 3則this_amount等於(element.days_rented - 3) * 1.5
      end

      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
      #如果element.movie.price_code等於NEW_RELEASE和符合element.days_rented > 1條件
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    result += "Amount owed is #{total_amount}\n" #輸出result
    result += "You earned #{frequent_renter_points} frequent renter points" #輸出result
    result
  end
end

####

class Movie #定義Movie類別
  REGULAR     =  0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title #讀取title
  attr_accessor :price_code #讀並寫price_code
  
  def initialize(title, price_code) #定義initialize，傳入兩個值之後，放入@title, @price_code實體變數中
    @title, @price_code = title, price_code
  end
end

####

class Rental #定義Rental類別
  attr_reader :movie, :days_rented #讀取movie、days_rented
  def initialize(movie, days_rented)#定義initialize，傳入兩個值之後，放入 @movie, @days_rented 實體變數中
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie')#Client產生新的Customer類別並傳入eddie(name)值
movie1 = Movie.new('ruby', Movie::NEW_RELEASE))#movie1產生新的Movie類別並傳入ruby(title), Movie::NEW_RELEASE(price_code)值
rental1 = Rental.new(movie1, 3)#rental1產生新的Rental類別並傳入movie1(movie), 3(days_rented)值
client.add_rental rental1 #rental 繼承 arg

movie2 = Movie.new('php', Movie::REGULAR)#movie2產生新的Movie類別並傳入php(title),  Movie::REGULAR(price_code)值
rental2 = Rental.new(movie2, 7)#rental1產生新的Rental類別並傳入movie2(movie), 7(days_rented)值
client.add_rental rental2 #renta2 繼承 arg

puts client.statement #輸出client.statement 

#整個程式的用途及運作方式：用途是計算租片的價格及天數
運作方式
1.client開始->Customer New ，之後就會進入Customer類別->add_rental方法->statement 方法->輸出result。
2.movie1->處理 Movie類別
3.rental1->運作 Rental類別
4.rental 繼承 arg
5.movie2->進入Movie類別
6.rental2-> 執行Rental類別
7.renta2 繼承 arg
8.輸出client.statement 
