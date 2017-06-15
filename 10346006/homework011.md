1. 請用「自己的話」舉例說明什麼叫做「Duck Typing」
#### 當人會跳舞，狗去實作人的跳舞，我就可以視為這隻狗可能是人
#### doDance只要是canDance都可以被當作認可參數。
以下是swift舉例。
``` swift
    protocol canDance {
        func dance()
    }
    class person : canDance{
        func dance(){
            // Dance Method
        }
    }
    class dog : canDance{
        func dance(){
            // Dance Method
        }
    }

    func doDance(c : canDance){
        c.dance()
    }
```

2. 請用「自己的話」舉例說明實體方法(instance method) 跟類別方法(class method) 的差別。

#### 實體方法大致上就是要宣告出來才能使用，以下Counter類別有三個實體方法方別是:
#### increment()
#### incrementBy()
#### reset()

#### 以下是swift實體方法舉例。
``` swift
class Counter {
  var count = 0
  func increment() {
    count++
  }
  func incrementBy(amount: Int) {
    count += amount
  }
  func reset() {
    count = 0
  }
}

let counter = Counter()

counter.increment()

counter.incrementBy(5)

counter.reset()

```
#### 類別方法在swift叫型別方法，類別方法大致上是，我只是單純要用一下方法，不需要去儲存或者宣告
## Ex:Array.append(element)

3. 在 Ruby 引入模組有兩種方式：include 跟 extend，請舉例並說明這兩個方法的差別？

```ruby
    # include:將module的方法以"實體"方法沿用
    Test.new.hi
    # extend:將module的方法以"類別"方法沿用
    Test.hi
```
