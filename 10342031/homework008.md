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

如果新增資料發生錯誤(可能未填)，會跳轉回new頁，同時原本以填寫的資料也會消失。

可以使用`render 'new'`，畫面導回時原本已填寫的資料會存在，之後再增加指令更可以將有錯誤的地方標示出來。

2. 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?

單純使用 JavaScript 的安全性不佳，使用者可能會跳過驗證，直接傳輸無關的資料。

在 Controller 裡檢查，看起來不錯，但是會使程式笨重，測試與維護的難度高。

綜合以上，在 Model 驗證資料是較好的選擇。


3. 什麼是 N + 1 問題，在 Rails 通常怎麼解決?

當A資料有N筆，會先查出A再進去撈資料出來，撈資料時就需要執行N次，所以總體來說會造成N+1筆的執行。

只要加上`includes`就可以改善，原本執行N次就改善成一次，只需要1+1次的執行就可以了。
