1.請說明在 controller 裡這段程式碼的差別
  def create
    @candidate = Candidate.new(candidate_params) 新增資料字串在資料庫

    if @candidate 如果成功加入就顯示'資料新增成功'，否則顯示'資料新增發生錯誤'
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end
  redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?會發生如果因必填欄位沒有填，而造成其他資料全部消失的慘況，通常可以輸入render 'new'就可以解決這樣的問題了

2.你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?
可以將人所寫的程式 Model 轉成資料庫看得懂的資料庫查詢語言（SQL），並且透過資料庫查詢語言，Model 可以從資料庫那邊取得你想要的資料。
3.什麼是 N + 1 問題，在 Rails 通常怎麼解決?
這個問題會發生的原因是資料庫存取時間花費太久，假設要找十筆資料，如果發生n+1問題，程式產生找出11筆資料，並且是一筆一筆去查，嚴重拖慢運作效率，解決方式是加上includes，尋找資料比較快，用一筆資料就可以撈出所有資料。
