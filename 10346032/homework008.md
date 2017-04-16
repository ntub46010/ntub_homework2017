請說明在 controller 裡這段程式碼的差別 def create @candidate = Candidate.new(candidate_params)

if @candidate.save
  redirect_to candidates_path, info: '資料新增成功'
else
  redirect_to new_candidate_path, info: '資料新增發生錯誤'
end
end 其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?

Answer: 
1.redirect_to new_candidate_path在檔案送出發現有錯誤後，會將頁面轉至完全空白的地方(把已填的都刪掉) 
2.通常以render :new 解決，他可以把已填的東西留住

2.你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?

Answer: 
寫在 Model可以不用重複撰寫，用JavaScript驗證，就可能會被忽略或跳過檢查，用Controller則會使結構變得複雜

3.什麼是 N + 1 問題，在 Rails 通常怎麼解決?

Answer: 
1.N+1問題就是一種減慢資料庫效能的問題，例如:vote裡面的這行程式@candidate = Candidate.find_by(id: params[:id])重複了很多次
2.加上include
