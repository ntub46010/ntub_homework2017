1. 請說明在 controller 裡這段程式碼的差別
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end 
  
其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?

ans: 1.redirect_to new_candidate_path在檔案送出發現有錯誤後，會將頁面轉至完全空白的地方(把已填的都刪掉) 2.通常以render :new 解決，他可以把已填的東西留住

2. 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?
ans: 寫在 Model 比較單純，可以不用重複撰寫，如果透過JavaScript驗證，就可利用其他方法跳過檢查，如果資料驗證是寫在Controller內，會需要重複的寫驗證語法，邏輯變得比較複雜。

3. 什麼是 N + 1 問題，在 Rails 通常怎麼解決?
ans: 資料庫容易產生N+1 query問題,意思是我們在迴圈當中大量查詢N筆資料,再加上開頭查詢的那1筆,稱為N+1可以使用includes方法解決
