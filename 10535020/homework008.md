請說明在 controller 裡這段程式碼的差別
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end
  redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?

你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?

什麼是 N + 1 問題，在 Rails 通常怎麼解決?
