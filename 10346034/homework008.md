1.請說明在 controller 裡這段程式碼的差別
A:資料新增成功跳到候選人列表頁面 失敗會回到新增候選人
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end
其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?
A:redirect_to new_candidate_path會把資料清除 通常使用render :new來把資料保留

2.你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?
A:如果用來JavaScript驗證，可使用些方法來跳過驗證，如果是在Controller裡做檢查，會使程式碼麻煩撰寫，讓結構變得很複雜。

3.什麼是 N + 1 問題，在 Rails 通常怎麼解決?
A:N+1 會導致程式逐項查詢，會使資料庫負荷龐大，影響其效能。
解決辦法:用include一次將資料取出做查詢
