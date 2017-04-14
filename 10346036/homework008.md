Q1.請說明在 controller 裡這段程式碼的差別
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end
其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?

A: redirect_to new_candidate_path會將以填寫好的資料也清空，跳回new頁面，需全部重填。
   通常使用render :new ，借View裡面的new樣板使用，避免資料被清空須重新填寫的問題。

Q2.你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?

A: 寫在 Model 比較單純，可以不用重複撰寫，如果透過JavaScript驗證，就可利用其他方法跳過檢查，如果資料驗證是寫在Controller內，會需要重複的寫驗證語法，邏輯變得比較複雜。

Q3.什麼是 N + 1 問題，在 Rails 通常怎麼解決?

A: N+1問題會拖慢資料庫的效能，如果有一程式是讀取user.car.name的值，假設User有10筆，程式會產生出11筆查詢指令，一筆是查User，另外10筆是逐一去查Car，這樣的程式會導致N+1問題。
   解決方法，就是加上includes，@users = User.includes(:car).page(params[:page])，這樣SQL查詢語言只有兩筆，一筆查詢User，一筆查詢所有Car資料。
