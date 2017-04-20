1. 請說明在 controller 裡這段程式碼的差別
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end 
其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?

   使用 redirect_to new_candidate_path 會將畫面重新導入，原本使用者填寫好的資料會被清除，若要解決此問題，使用render :new 即可解決


2. 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?
    若使用JavaScript做驗證，使用者可透過一些特殊技巧，在輸入資料時，不須經過驗證，即可確認
    若使用Controller做驗證，則容易重複寫驗證程式，使程式複雜化，不易偵錯


3. 什麼是 N + 1 問題，在 Rails 通常怎麼解決?
    N+1是指利用迴圈，查詢資料的次數，假如要查10筆聯絡人資料，則會執行10+1=11次，若是資料數量龐大，會占用記憶體，且查詢速度慢，可使用includes，解決
