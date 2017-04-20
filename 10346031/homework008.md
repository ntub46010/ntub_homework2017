  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end

1.其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?

在資料新增錯誤時，redirect_to new_candidate_path會將其重新倒回新增頁面，同時將已輸入的資料保留，而非將資料清除。

2.你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?

使用JavaScript將會讓他人容易將異樣表單送入，造成資料過於混亂。

而在controller進行驗證，會導致重複驗證，將程式邏輯複雜化，使得驗證變得困難、不易重複使用。

故將驗證顯在model相較於上述2種方法較為簡單、安全。

3.什麼是 N + 1 問題，在 Rails 通常怎麼解決?

N+1問題 是當資料查詢總次數高時，資料庫效能較低，EX:查詢6次已加入會員姓名時，必須先查詢已加入會員，再逐次查詢對應姓名。

通常使用includes方法，將查詢次數降低。
