# 作業 008

1. 請說明在 controller 裡這段程式碼的差別

```ruby
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end
```

其中這行 `redirect_to new_candidate_path` 這樣的寫法有什麼問題? 通常會怎麼解決?
> 會轉頁到新增候選人的頁面，那麼剛剛新增候選人的一些資料就不會被儲存，而是全部空白，需要再重新填寫一次
  render 'new' 重新繪製new頁面的畫面，資料存在@candidate，給new，使得剛剛打到一半的資料不需要重新再填寫

2. 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?
    * 如果使用JavaScript，在使用者端可以透過瀏覽器的開發模式下或其他設定下，繞過JavaScript的驗證規則，或是傳送表單以外的參數
    * 如果使用Controller，若Controller的數量變多，而每個Controller存的資料都是一樣，那麼同一段資料驗證的程式碼，就要寫好幾份，撰寫費時費事、不易維護
    * 寫在Model我認為是任何資料的動作都要經過Model，做新增修改刪除，那麼寫在Model就會比較單純、合理

3. 什麼是 N + 1 問題，在 Rails 通常怎麼解決?
    * n+1 queries 是指說假設有顧客和訂單的資料表，現在要查對應的訂單，在這個情況下，會先去資料庫找出所有顧客的資料(u_id)(第一次),再去
      查詢n筆對應的訂單資料(o_id)，那麼就會造成n+1 query問題產生
    * Rails裡可以使用include或joins的方式
      * include把select查詢的指令變成兩條，第一條一樣先找出顧客id，第二條是找訂單id，查詢條件的參數包含前面找到的所有顧客id
      * joins是把所有訂單資料包含顧客id的資料抓出來
      * 差別在於include需要顧客和訂單資料表來查詢，而join只需要訂單資料表即可
