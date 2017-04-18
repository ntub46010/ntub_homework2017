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

Ans:<br />
redirect_to會從Controller Action重跑一次,不會將我們原本填好的資料保留下來,<br />
通常改成使用render解決,render不會從Controller Action重跑,<br />
而是重跑原本的new的template<br />
而我們在new的template內有使用form_for這個helper<br />
我們按出送出時,它會將資料儲存成一個hash<br />
所以當我們render時,其實是form_for顯示之前填得資料<br />


2. 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?

Ans:<br />
寫在前端是有可能被忽略掉驗證的,<br />
寫在Controller裡的話,Controller處理的事情太多,程式碼繁雜<br />
寫在Model相對單純

3. 什麼是 N + 1 問題，在 Rails 通常怎麼解決?

資料庫容易產生N+1 query問題,意思是我們在迴圈當中大量查詢N筆資料,<br />
再加上開頭查詢的那1筆,稱為N+1<br />
可以使用includes方法解決
