#此程式可以將客戶所租的影片紀錄，計算總共的價錢以及可以獲得的點數。
#如果影片是REGULAR，價錢就是兩元，租期超過兩天會有打折。
#如果影片是NEW_RELEASE，價錢就是租期天數乘三塊錢。
#如果影片是CHILDRENS，價錢就是一點五元，租期超過三天會有打折。
#每租一片，點數就加一點，如果影片是NEW_RELEASE且租期天數大於一，就可再額外增加一點
#最後將這些紀錄做輸出。
class Customer
  attr_reader :name									                  #可讀取name

  def initialize(name)									              # name 的值放入實體變數中，@rentals為一陣列，有 實體 = Customer.new() 時會呼叫此方法。
    @name    = name
    @rentals = []
  end

  def add_rental(arg)									                # 將arg放入@rentals陣列，當實體.add_rental時會呼叫此方法。
    @rentals << arg
  end

  def statement										                    #選擇@rentals陣列中的price_code做判斷，執行相對應的運算，如果是REGULAR，this_amount加二，大於二的話，將days_rented減二之後乘一點五;如果是NEW_RELEASE，this_amount加days_rented乘三;如果是CHILDRENS，this_amount加一點五，大於三的話，將days_rented減三之後乘一點五。
    total_amount = 0									                #frequent_renter_points加一，判斷price_code是否為NEW_RELEASE以及days_rented大於一，是則frequent_renter_points再加一。
    frequent_renter_points = 0								        #將 title、this_amount 的值和result串一起，並加總this_amount。
    result = "Rental Record for #{@name}\n"						#result與Amount owed is #{total_amount}和You earned #{frequent_renter_points} frequent renter points串連在一起，並回傳給client.statement。

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

  attr_reader :title									                      #可讀取title，可讀寫price_code，將 title , price_code 的值放入實體變數中。
  attr_accessor :price_code

  def initialize(title, price_code)							            #有 實體 = Movie.new() 時會呼叫此方法。
    @title, @price_code = title, price_code
  end
end

####

class Rental
  attr_reader :movie, :days_rented
											                                      #將 movie , days_rented 的值放入實體變數中。
  def initialize(movie, days_rented)							          #有 實體 = Rental.new() 時會呼叫此方法。
    @movie, @days_rented = movie, days_rented			
  end
end

####

client = Customer.new('eddie')								              #建立Customer的實體client，且client的@name為eddie。

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)						  #建立Movie、Rental的實體，將各個參數給予到相對應的實體變數，利用add_rental方法將Rental實體加入@rentals陣列中。
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)						        #建立第二個Movie、Rental的實體。
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement									                      #印出statement方法所回傳的結果，顯示是誰的租借紀錄、電影標題、價錢、獲得的點數。
											                                      #Rental Record for eddie
                                                  					#        ruby    9 
                                                   					#        php     9.5 
                                                  					#Amount owed is 18.5          
                                                   					#You earned 3 frequent renter points
