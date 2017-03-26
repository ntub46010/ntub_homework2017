class Customer
  attr_reader :name	#讀客戶姓名name

  def initialize(name)	#在new方法時，將客戶姓名和租金的參數分別傳給@name和@rentals
    @name    = name
    @rentals = []
  end

  def add_rental(arg)	#將參數arg導入@rentals實體變數裡
    @rentals << arg
  end

  def statement
    total_amount = 0	#租金總計預設為0
    frequent_renter_points = 0	#點數預設為0
    result = "Rental Record for #{@name}\n"	#result字串為Rental Record for {客戶姓名}

    @rentals.each do |element|	#計算每部片的租金
      this_amount = 0
      case element.movie.price_code
      when Movie::REGULAR		#當movie.price_code是Movie::REGULAR，租金是2，如果租的天數大於2天，則租金再加上(天數-2)*1.5
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE	#當movie.price_code是Movie::NEW_RELEASE，租金是租的天數*3
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS	#當movie.price_code是Movie::CHILDRENS，租金是1.5，如果租的天數大於3天，則租金再加上(天數-3)*1.5
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      frequent_renter_points += 1	#每租一部片點數+1，如果element.movie.price_code 等於 Movie::NEW_RELEASE且租的天數大於1，點數再+1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"	#resulty字串再加上片名和租金金額
      total_amount += this_amount		#總金額再加上這部片的金額
    end

    result += "Amount owed is #{total_amount}\n"		#result字串再加上Amount owed is {總金額}
    result += "You earned #{frequent_renter_points} frequent renter points"		#result字串再加上You earned {點數總額} frequent renter points
    result	#回傳result字串
  end
end

####

class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title	#title可讀
  attr_accessor :price_code	#price_code可讀可寫

  def initialize(title, price_code)	#在new方法時，將title和price_code的參數分別傳給@title和@price_code
    @title, @price_code = title, price_code
  end
end

####

class Rental
  attr_reader :movie, :days_rented	#movie和days_rented可讀

  def initialize(movie, days_rented)	#在new方法時，將movie和days_rented的參數分別傳給@movie和@days_rented
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie')	#新增一個Customer名稱為client參數是eddie

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)	#分別給予類別參數，且傳遞到client類別
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)		#分別給予類別參數，且傳遞到client類別
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement	#輸出client.statement的result字串

