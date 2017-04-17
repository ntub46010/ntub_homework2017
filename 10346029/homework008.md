### 請說明在 controller 裡這段程式碼的差別

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

### 其中這行 `redirect_to new_candidate_path` 這樣的寫法有什麼問題? 通常會怎麼解決?
<br>

解答 ：
<br>
當網頁要填的項目很多時若少填一個欄位，或是新增錯誤時會導向new_candidate_path，但是他並不會保留原本所填欄位的資料。<br>
將 `else` 裡下方的 `redirect_to new_candidate_path, info: '資料新增發生錯誤' ` 改為 ` render 'new' ` 來解決此問題，
<br>
### 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查? <br>
解答 <br>
駭客或有心人士能直接跳過網頁直接傳值到model，而驗證寫在model可以抵擋上述情況。

### 什麼是 N + 1 問題，在 Rails 通常怎麼解決?

解答 <br>
N為第一次搜尋出的資料，1為第一次的搜尋。<br>
例： <br>
有兩張表，第一張為主表另一張為明細表，倘若要查10筆資料。<br>
第一次搜尋先搜尋10筆資料，接下來程式會自動搜尋這10筆的明細資料，所以總共做11次搜尋。<br>
此問題會拖累資料庫的效能。在Rails可以用includes解決。


