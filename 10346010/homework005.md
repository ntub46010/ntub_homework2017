#本程式用以紀錄顧客們租借電影的紀錄
#電影由名稱及片種組成、電影與租借天數組成租借事件、租借事件之集合與顧客名字則組成顧客
#流程為藉由名字來建立顧客，再依次建立電影、租借事件，並寫入顧客資料中
#之後可透過顧客的statement方法讀取顧客資料，計算出總積欠租金、總frequent_renter_points，並輸出租借紀錄

#顧客類別
class Customer
  attr_reader :name

  def initialize(name) #顧客由名字、所有租借事件組成
    @name    = name
    @rentals = [] #租借事件的集合
  end

  def add_rental(arg)
    @rentals << arg #將租借事件附加到集合
  end

  def statement #輸出某顧客的各次租借紀錄、總積欠租金、總frequent_renter_points
  
    #初始化總積欠租金、frequent_renter_points、待輸出的租借紀錄
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"
    
    #統計各次租借的電影名稱、租金，並同時計算總租金、總frequent_renter_points
    @rentals.each do |element|
      this_amount = 0 #該次租金做初始化
      
      #根據租借片種及租借天數來計算租金
      #一般片基本租金為2元，租超過2天，每日追加1.5元
      #新片租金為每日3元
      #兒童片基本租金為1.5元，租超過3天，每日追加1.5元
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
      
      #計算frequent_renter_points
      #租借一次可得1點，若為新片且租超過1天則再多獲1點
      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n" #輸出附加該次電影名稱和租金
      total_amount += this_amount #累積至總租金，待統計完成後輸出
    end

    #輸出附加總租金和frequent renter points
    result += "Amount owed is #{total_amount}\n" #總積欠租金
    result += "You earned #{frequent_renter_points} frequent renter points"
    result #輸出整個租借紀錄
  end
end

####
#電影類別
class Movie
  #定義一般片、新片、兒童片三個片種的代號(price_code)
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title
  attr_accessor :price_code #片種代號可供外部存取
  
  def initialize(title, price_code) #電影物件由電影名稱、片種代號組成
    @title, @price_code = title, price_code
  end
end

####
#租借事件類別
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented) #租借事件由電影物件、租借天數組成
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #建立一個顧客，名叫eddie

movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #建立電影物件，名稱為ruby，片種為新片
rental1 = Rental.new(movie1, 3) #建立租借事件，項目為電影ruby，租借天數為3天
client.add_rental rental1 #將該租借事件寫入顧客中

#第二次租借
movie2 = Movie.new('php', Movie::REGULAR) #建立電影php，一般片
rental2 = Rental.new(movie2, 7) #租借電影php，7天
client.add_rental rental2 #寫入

#顯示顧客租借紀錄
puts client.statement
