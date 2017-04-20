
## 1.請說明在 controller 裡這段程式碼的差別
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
## 其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?
 
 若使用redirect_to new_candidate_path，當資料新增失敗，會到新的新增候選人資訊頁面，必須重新輸入資訊，
 
 若使用render 'new'，會回到剛剛新增候選人的頁面，資料還在可以繼續編輯。

## 2.你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?

若使用JavaScript，當使用者在html頁面輸入資料即進行驗證，使用者可能會關閉Java功能，或是檢視網頁原始碼來通過，

若採在Controller內檢查，程式碼會變得更複雜，驗證不容易被重複測試和使用，因此將機制寫在 Model 裡會比較簡單方便。

## 3.什麼是 N + 1 問題，在 Rails 通常怎麼解決?
假設要找出10筆使用者ID，要先執行1次搜尋出10個使用者，再執行10次取得使用者ID，總共會執行11次，

若查詢資料量大，會影響效能。
可以使用include取出所有資料再作查詢。
