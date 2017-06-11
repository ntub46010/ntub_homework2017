### 1.請用「自己的話」舉例說明什麼叫做「Duck Typing」
<p>A：</p>
Duck typing是在思考一組行為集合，就像判別一隻鴨子，是從他有鴨子的叫聲、像鴨子一樣走路，觀察他的行為之後，判定他是隻鴨子。
通常用在動態定型語言，因為不用事先定義物件型態，只需思考這組行為是否適合運用在該類別，所以可以供任何呼叫的對象使用。

<pre><code>def doQuack(duck)
   duck.quack
end
</code></pre>

參數duck沒有宣告任何型態，所以就不會有任何型態約束，只要傳進來的物件具有quack方法就可以了。

---------------------------------------------------------------------------------------------------------------------

### 2.請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
<p>A：</p>

類別方法是把物件定義一些動作或是狀態。
<pre><code> class Bird
    def can(fly)
      puts "#{fly} 我可以飛!!"
    end
 end
</code></pre>

實體方法則是把類別用方法把他實現化。
<pre><code> duck = Bird.new
duck.can "我在天空"  #=> 印出「我在天空 我可以飛!」
</code></pre>

---------------------------------------------------------------------------------------------------------------------

### 3.在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
<p>A：</p>

在TestClass類別裡使用include Log，會讓TestClass類別產生的實體，繼承Log模組裡的方法。

<pre><code>module Log 
  def class_type
    "This class is of type: #{self.class}"
  end
end

class TestClass 
  include Log 
end

tc = TestClass.new.class_type
puts tc #This class is of type: TestClass
</code></pre>

在TestClass類別裡使用extend Log，會讓TestClass類別有Log模組裡的方法，TestClass類別卻不會繼承實體。

<pre><code>
module Log
  def class_type
    "This class is of type: #{self.class}"
  end
end

class TestClass
  extend Log
  # ...
end

tc = TestClass.class_type
puts tc  # This class is of type: TestClass
</code></pre>
