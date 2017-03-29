```ruby
class Customer #顧客類別
  attr_reader :name #顧客裡面有個name變數可以直接讀取

  def initialize(name) #建立實體時初始化的方法，顧客名字給@name實體變數，@rentals為空陣列
    @name    = name
    @rentals = []
  end

  def add_rental(arg) #租借紀錄的實體加到@rentals
    @rentals << arg
  end

  def statement #顧客實體的租借紀錄狀態
    total_amount = 0  #總金額=0
    frequent_renter_points = 0 #點數=0
    result = "Rental Record for #{@name}\n"  #租借紀錄是哪一個顧客的，把顧客的名字變數放進來 eddie的

    @rentals.each do |element| #兩個租借紀錄，依序把值帶出來
      this_amount = 0 #當前一筆的金額是0
      case element.movie.price_code #判斷電影的種類，計算租金
      when Movie::REGULAR #普通的，金額+2，租借天數超過兩天，再加(天數-2)*1.5
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE #最新的，天數*3
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS #孩童片，金額+1.5，如果天數大於3，+(天數-3)*1.5
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      frequent_renter_points += 1 #借一部影片算一點
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1 #如果影片的種類是最新的租借天數大於一天，點數再加一
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n" #印出電影名稱、租借金額
      total_amount += this_amount # #總租借金額
    end

    result += "Amount owed is #{total_amount}\n" #印出總出借金額
    result += "You earned #{frequent_renter_points} frequent renter points" #印出總點數
    result
  end
end

####

class Movie #電影類別，下面3種種類
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title #電影名字可讀取
  attr_accessor :price_code #種類可讀可寫

  def initialize(title, price_code) #電影名稱、種類
    @title, @price_code = title, price_code #@title=title ,@price_code=price_code 
  end
end

####

class Rental #租借紀錄
  attr_reader :movie, :days_rented #電影實體、天數可讀

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

####

client = Customer.new('eddie') #顧客eddie

movie1 = Movie.new('ruby', Movie::NEW_RELEASE) #電影1名稱ruby,種類最新的
rental1 = Rental.new(movie1, 3) #租借紀錄 電影1、天數3
client.add_rental rental1 #加到eddie的租借紀錄裡

movie2 = Movie.new('php', Movie::REGULAR) #電影2名稱php,種類普通的
rental2 = Rental.new(movie2, 7) #租借紀錄 電影2、天數7
client.add_rental rental2 #把電影2的租借紀錄加到eddie租借紀錄裡

puts client.statement #印出eddie的租借紀錄狀態

```

