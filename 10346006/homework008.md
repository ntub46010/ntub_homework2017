# 1.
# 
# def create
#    @candidate = Candidate.new(candidate_params)
#
#    if @candidate.save
#      redirect_to candidates_path, info: '資料新增成功'
#    else
#      redirect_to new_candidate_path, info: '資料新增發生錯誤'
#    end
#  end

# redirect_to new_candidate_path這樣寫會導致 如果資料新增發生錯誤就會讓網頁剛剛填的資料都不見
# 解決方法 render new_candidate_path
# 
# 
# 2.
# JavaScript的話 會讓使用者可以隱藏掉不驗證
# Controller的話 會讓程式每次都要做驗證，在Model的話只要確定說條件不達成就會直接回傳false
# 
# 
# 
# 3.
# N+1就是在查詢一張表的關聯的資料，都要去對DB做一次查詢，這樣會造成DB效能的一種消耗
# 
# 一般來說都用include去解決這個問題
# ex:
# comments = Comment.includes(:post)
# Comment.each do |comment|
#     comment.post.title
# end
# 
