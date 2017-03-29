class Customer
  attr_reader :name   #讀取name

  def initialize(name)    #因Customer.new('eddie')，所以@name = eddie
    @name    = name
    @rentals = []
  end

  def add_rental(arg)   #傳入rental1的@movie, @days_rented實體到arg，並放入@rentals
    @rentals << arg      傳入rental2的@movie, @days_rented實體到arg，並放入@rentals
  end

  def statement    
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"   #result = "Rental Record for eddie"

    @rentals.each do |element|                                                           #依element.movie.price_code 去尋找，@price_code = Movie::NEW_RELEASE，所以執行this_amount += element.days_rented * 3，
                                                                                         this_amount = 9，frequent_renter_points = 1，因if成立，所以frequent_renter_points = 2，result = ruby    9 
      this_amount = 0                                                                    total_amount = 9；依element.movie.price_code 去尋找，@price_code = Movie::REGULAR，所以執行this_amount += 2
                                                                                         this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2，this_amount = 9.5
                                                                                         ，frequent_renter_points = 2，因if不成立，result = php     9.5。
                                                                                           
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

    result += "Amount owed is #{total_amount}\n"                               #Amount owed is 18.5                                                                                        
                                                                               #You earned 3 frequent renter points
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end

####

class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title                         #讀取title
  attr_accessor :price_code                  #可讀可寫price_code

  def initialize(title, price_code)          #movie1：因Movie.new('ruby', Movie::NEW_RELEASE)，所以@title = "ruby"，@price_code = Movie::NEW_RELEASE
    @title, @price_code = title, price_code   movie2：@title = "php"，@price_code = Movie::REGULAR
  end
end

####

class Rental
  attr_reader :movie, :days_rented             #讀取movie、days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented  #rental1：傳入movie1的 @title, @price_code 這兩個實體到 @movie；@days_rented = 3
  end                                           rental2：傳入movie2的 @title, @price_code 這兩個實體到 @movie；@days_rented = 7
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

#這個程式是在計算租借點數和紀錄租借紀錄，透過new給予客戶姓名、片名等資料，再從Movie::??判斷。若是Movie::REGULAR，租金=2元，天數如果>2天，則把多的天數*1.5元；如果是Movie::NEW_RELEASE，租金=天數*3；如果是Movie::CHILDRENS，租金=1.5，天數如果>3天，則把多的天數*1.5元。
#輸出eddie租的片種以及每部片的租金、總金額和總點數
