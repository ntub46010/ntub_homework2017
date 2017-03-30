# 作業 005

```ruby
class Customer
  attr_reader :name

  def initialize(name)
    @name    = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

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
```

### 類別  ```Customer``` 的定義：

1. 類別  ```Customer``` 中有三個新定義的方法： ```initialize``` 、 ```add_rental``` 、 ```statement```
2. 方法 ```attr_reader``` 讓 instance 可以從外「讀取」 name 為實體變數
3. 方法 ```initialize``` 定義實體變數 ```@name``` (值由外部讀取)，以及設 ```@rentals``` 初值為空陣列
4. 方法 ```add_rental``` 將外部參數 ```arg``` 的值加入陣列 ```@rentals``` 中
5. 方法 ```statement```
*  將變數 total_amount、frequent_renter_points 的初值設為0

    將 result 的初值設為字串 'Rental Record for' 加上由外部讀取的實體變數 ```@name``` 的值 (ex. eddie) => 'Rental Record for eddie'

    用 .each 方法處理陣列 ```@rentals``` 中每一個物件的實體變數為 days_rented，以及子物件的實體變數 ```@price_code``` 的值之不同做不同計算
    >每個陣列值為來自類別  ```Rental``` 的實體，類別  ```Rental``` 的實體，其第一個實體變數 ```@movie``` ， 第二個實體變數為 days_rented

    >實體變數 ```@movie``` 是來自類別  ```Movie``` 的實體，第一個實體變數為 title，第二個實體變數 ```@price_code```

    price_code 為 ```REGULAR``` 則 基本費用為2單位，如果租借天數超過2，則超出2的天數以1.5單位計價

    price_code 為 ```NEW_RELEASE``` 則 費用為租借天數每天3單位計價

    price_code 為 ```CHILDRENS``` 則 基本費用為1.5單位，如果租借天數超過3，則超出3的天數以1.5單位計價

*  有一次租借交易 frequent_renter_points 點數加 1
*  如果租借 price_code 為  ```NEW_RELEASE``` ，而且租借天數超過 1 天的話， frequent_renter_points 點數再加 1
*  將 tab(空格) 、 電影的 title、tab(空格) 、單支影片的租借費用、換行 等字串加入 result 字串中 => '    ruby    9'
*  將本片租借費用 this_amount 加入總租借費用 total_amount 中
*  將 "Amount owed is "、總租借費用 total_amount、換行 等字串加入 result 字串中 => 'Amount owed is 18.5'
*  將 "You earned "、 frequent_renter_points 點數、" frequent renter points" 等字串加入 result 字串中 => 'You earned 3 frequent renter points'
*  傳回字串 result

```ruby
class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end
```

### 類別  ```Movie``` 的定義：

1. 定義常數： ```REGULAR``` 值為零、 ```NEW_RELEASE``` 值為1、 ```CHILDRENS``` 值為2
2. 方法 ```attr_reader``` 讓 instance 可以從外「讀取」 title 為實體變數
3. 方法 ```attr_accessor``` 讓 instance 可以從外「讀取+設定」 price_code 為實體變數
4. 方法 ```initialize``` 定義實體變數 ```@title``` (值由外部讀取)，以及 ```@price_code``` (值由外部讀取，例如：```REGULAR``` 值為零、 ```NEW_RELEASE``` 值為1、 ```CHILDRENS``` 值為2)

```ruby
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end
```

### 類別  ```Rental``` 的定義：

1. 方法 ```attr_reader``` 讓 instance 可以從外「讀取」 movie, days_rented 為實體變數
2. 方法 ```initialize``` 定義實體變數 ```@movie``` (值由外部讀取)，以及 ```@days_rented``` (值由外部讀取)

```ruby
client = Customer.new('eddie')

movie1 = Movie.new('ruby', Movie::NEW_RELEASE)
rental1 = Rental.new(movie1, 3)
client.add_rental rental1

movie2 = Movie.new('php', Movie::REGULAR)
rental2 = Rental.new(movie2, 7)
client.add_rental rental2

puts client.statement
```

### 程式部分說明：

1. 產生類別 ```Customer``` 的一個實體 ```client``` ，實體變數 ```@name``` 值為 eddie
*  有一位顧客名為 eddie

2. 產生類別 ```Movie``` 的一個實體 ```movie1``` ，實體變數 ```@title``` 值為 ruby，以及 ```@price_code``` 為 常數 ```NEW_RELEASE``` 值為1
    產生類別 ```Rental``` 的一個實體 ```rental1``` ，實體變數 ```@movie``` 值為 movie1，以及 ```@days_rented``` 值為 3
    呼叫實體 ```client``` 的方法 ```add_rental``` ，將實體 ```rental1``` 為參數傳至 ```client``` 的實體變數陣列 ```@rentals``` 中
*  租一部新發行的電影 ruby
*  租該部電影，租 3 天
*  將租 ruby 3 天的資訊加入租用紀錄中

3. 產生類別 ```Movie``` 的一個實體 ```movie2``` ，實體變數 ```@title``` 值為 php，以及 ```@price_code``` 為 常數 ```REGULAR``` 值為0
        產生類別 ```Rental``` 的一個實體 ```rental2``` ，實體變數 ```@movie``` 值為 movie2，以及 ```@days_rented``` 值為 7
        呼叫實體 ```client``` 的方法 ```add_rental``` ，將實體 ```rental2``` 為參數傳至 ```client``` 的實體變數陣列 ```@rentals``` 中
*  租一部一般的電影 php
*  租該部電影，租 7 天
*  將租 php 7 天的資訊加入租用紀錄中

4. 將實體 ```client``` 的方法 ```statement``` 執行結果印出來
*  變數 total_amount、frequent_renter_points 的初值設為0

#####  result 的初值設為字串 'Rental Record for eddie'

*  針對每一部電影的相關資訊處理：
    第1部 新發行電影 ruby 租 3 天，this_amount = 3 * 3 = 9，租金為 9
    有一次租借交易 frequent_renter_points 點數加 1，frequent_renter_points = 1
    因為 ruby 是新片且租借天數超過 1 天， frequent_renter_points = 1 + 1 = 2

#####  result 字串 接上 '        ruby    9' 字串

    total_amount = total_amount + this_amount = 0 + 9 = 9

    第2部 一般的電影 php 租 7 天，this_amount = 2 + (7 - 2) * 1.5 = 9.5，租金 9.5
    有一次租借交易 frequent_renter_points 點數加 1，frequent_renter_points = 2 + 1 = 3

#####  result 字串 接上 '        php     9.5' 字串

    total_amount = total_amount + this_amount = 9 + 9.5 = 18.5

*  將 "Amount owed is "、總租借費用 total_amount、換行 等字串加入 result 字串中

#####  result 字串 接上 'Amount owed is 18.5' 字串

*  將 "You earned "、 frequent_renter_points 點數、" frequent renter points" 等字串加入 result 字串中

#####  result 字串 接上 'You earned 3 frequent renter points' 字串

*  傳回字串 result  

### 程式執行結果
```
Rental Record for eddie
        ruby    9
        php     9.5
Amount owed is 18.5
You earned 3 frequent renter points
```

----

請幫上面這段程式碼加上「適當」的程式碼註解或說明。

## 注意事項：

1. 請新增檔案 `homework005.md` 到個人資料夾中，並發 PR 至 `homework/005` 分支。
2. 請詳閱首頁的作業繳交注意事項。

## 繳交期限：2017/3/30 23:59 前
