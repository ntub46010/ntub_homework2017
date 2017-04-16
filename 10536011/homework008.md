## 作業008
**1. 請說明在 controller 裡這段程式碼的差別**
```  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end 
  ```
**其中這行 ```redirect_to new_candidate_path``` 這樣的寫法有什麼問題? 通常會怎麼解決?**  

在新增錯誤時，畫面會重新導向new.html.erb，但原先填的資料將會清空，通常會用```render :new```來解決，讓畫面重新new.html.erb時，原先填寫資料還在，錯誤地方標示出來。  

**2. 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?**  

因為若使用JavaScript做驗證，別人可以輕易的製作一個異樣的表單，就可以把資料送進來，這樣會造成資料大亂，若在Controlloer裡檢查，會變成重複在寫驗證，導致程式碼邏輯變得複雜，使，
驗證不容易被重複使用，也不容易被測試，所以寫在 Model 裡是比較合理且單純的。 

**3. 什麼是 N + 1 問題，在 Rails 通常怎麼解決?**  

N+1問題是查詢總次數高，資料庫效能變慢，例如:我要找出5筆商品的商品明細，必須要先執行1次找出5筆商品，再加上執行5次的商品明細，共執行6次，若資料量龐大，則問題就會很嚴重，通常會使用includes方法，減少查詢次數。
