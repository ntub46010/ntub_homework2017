1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」
``` java
如果有一個方法只允許會飛當參數近來,如果有一隻狗實作了"飛",它也能夠傳入當參數
以java為例 :

    public interface Flyable{
		void fly();
	}

	class Bird implements Flyable{
		public void fly(){
            // bird fly
        }
	}

	class Dog implements Flyable{
		public void fly(){
            // dog fly
        }
	}

	public void doFly(Flyable f){
		f.fly();
	}

```

2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。
``` java
以java為例
class Test{
    public static void hi(){

    }
    public void hi(){

    }
    public static main(String[] args){
        // 類別方法
        Test.hi();
        // 實體方法
        Test t = new Test();
        t.hi();
    }
}

差別在於實體方法需要將物件建立出來並透過變數呼叫
```
3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？
```ruby
include:將module的方法以實體方法沿用
Test.new.hi
extend:將module的方法以類別方法沿用
Test.hi
```