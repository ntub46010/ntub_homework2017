1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」
→我們編寫一個函式不需要在意他的資料型別是什麼，反而是著重在它動作上。例如宣告一個動作"飛"，不避拘泥於物件只能是鳥，可以定義任何物件(像是豬、雞、狗)擁有"飛"這個動作。

2. 用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
→實體方法(instance method)：使用此方法須new才可以使用
  Jack = Student.new("170", "65")
  Jack.information

→類別方法(class method)：不需要new即可使用
 #...
  def index
      @students = Student.all
    end
  end
  
  class Student
    def self.all
    end
  end
  
  3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
  →include：讓class所產生的instance繼承模組中的方法。
  →extend：讓class具有模組中的方法，但instance不繼承。
