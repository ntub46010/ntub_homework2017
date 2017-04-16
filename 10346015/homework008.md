1. #資料新增成功會轉去候選人列表，新增失敗轉到新增候選人的頁面
   #但使用new_candidate_path會將原本已鍵入的資料全部洗掉不見必須重打，使用render :new會將原本鍵入資料保留住
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end

2.若在前端驗證，雖然JavaScript可以在使用者填寫資料時直接檢查欄位，但如果把JavaScript功能關閉就能跳過驗證，
  使用者也可以用檢視HTML原始碼，自己做一樣的表單送資料進來，所以可靠性並不高。MVC中雖然Controller和View都可
  以做驗證，但是會讓程式碼變得更複雜也不好重複使用和測試，在Model做檢查只有通過驗證的資料才能存到資料庫，也
  不會在用戶端被跳過驗證，也更好測試，所以在Model做驗證是最佳選擇。
  
3.N+1問題：如果要查詢n筆資料，就必須執行n+1次select查詢語句，如此效率很慢會影響性能。
  解決方法：rails用includes一次撈出所有資料。
