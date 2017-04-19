# 作業 008

1. 請說明在 controller 裡這段程式碼的差別

```ruby
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end
```

其中這行 `redirect_to new_candidate_path` 這樣的寫法有什麼問題? 通常會怎麼解決?

----
#### 答案 1.

* `redirect_to new_candidate_path` 這樣的寫法，當資料輸入發生錯誤時，會聯結新增資料的新畫面，所有欄位都清空，所有欄位資料必須重新輸入。
* 將 `redirect_to new_candidate_path` 這行改寫為 `render 'new' `，借用 new.html.erb 的畫面，只有錯誤資料欄位清空，其他欄位資料不需重新輸入。
----

2. 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?

----
#### 答案 2.

*  Controller 負責判斷該執行哪個動作，資料驗證便是由 Model 所負責，由 Model 負責資料的驗證，將該取的資料依所需一次取好，打包給 Controller 中相對的 Action 運用。
----

3. 什麼是 N + 1 問題，在 Rails 通常怎麼解決?

----
#### 答案 3.

*  每一筆查詢對資料庫的效能都是一種消耗，因此查詢資料庫的次數是越少越好。
*  一般資料庫容易產生的 N+1 query 問題，意思是我們在迴圈當中大量查詢 N 筆資料，再加上開頭查詢的那 1 筆，稱為 N + 1。
*  為了避免在資料查詢時大量消耗不必要的記憶體，Rails 提供 joins 和 include 方法，可以在第一次查詢時將所有需要的資料一次查完。
*  只要從 model 把資料抓到 controller 之後，剩下的我們就可以自行處理。
*  例如：
```
comments = Comment.includes(:post)
Comment.each do |comment|
    comment.post.title
end
```
*  使用這個 include 方法，會在載入 comments 時，就先把各項內容載入，解決 N + 1 的狀況，先將需要的資料一次查好。
----

## 注意事項：

1. 請在你的個人目錄下，新增檔案 `homework008.md`，完成後發 PR 至 `homework/008` 分支。
2. 請詳閱首頁的作業繳交注意事項。

## 繳交期限：2017/4/20 23:59 前
