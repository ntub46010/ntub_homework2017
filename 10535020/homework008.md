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
存取資料庫是一種相對很慢的I/O的操作：每一條SQL query都得耗上時間、執行回傳的結果也會被轉成ActiveRecord物件全部放進記憶體，N+1 queries是資料庫效能頭號殺手，假設User有10筆，這程式會產生出11筆Queries，一筆是查User，另外10筆是一筆一筆去查Car，嚴重拖慢效能，這就是N + 1 問題。
SELECT * FROM `users` LIMIT 10 OFFSET 0
SELECT * FROM `cars` WHERE (`cars`.`user_id` = 1)
SELECT * FROM `cars` WHERE (`cars`.`user_id` = 2)
SELECT * FROM `cars` WHERE (`cars`.`user_id` = 3)
...
...
...
SELECT * FROM `cars` WHERE (`cars`.`user_id` = 10)
解決方法，加上includes：
def index
  @users = User.includes(:car).page(params[:page])
end
如此SQL query就只有兩個，只用一個就撈出所有Cars資料。
