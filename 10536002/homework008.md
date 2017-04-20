1.請說明在 controller 裡這段程式碼的差別


>  def create
>    @candidate = Candidate.new(candidate_params)
>
>    if @candidate.save
>      redirect_to candidates_path, info: '資料新增成功'
>    else
>      redirect_to new_candidate_path, info: '資料新增發生錯誤'
>    end
>  end


其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?
`redirect_to new_candidate_path`會導向新的頁面，使用者之前打的資料會不見。通常會使用`render new_candidate_path`使用者之前打的資料還會留著



2.你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?
如果寫在JavaScript當使用者關掉瀏覽器JavaScript的功能或是使用一些技巧可以跳過驗證。
如果寫在 Controller如果有許多action都會用到相同的驗證，那需要重複寫相同的功能，且不易維護。



3.什麼是 N + 1 問題，在 Rails 通常怎麼解決?
N+1 query問題，意思是我們在迴圈當中大量查詢N筆資料，再加上開頭查詢的那1筆，稱為N+1。
為了避免在幾千筆資料查詢時大量消耗不必要的記憶體，Rails提供joins和include方法可以在第一次查詢時將所有我們需要的資料一次查完。
