# 作業 008

1. 請說明在 controller 裡這段程式碼的差別

```ruby
  def create
    @candidate = Candidate.new(candidate_params) # 實體變數做新增類別

    if @candidate.save
      redirect_to candidates_path, info: '資料新增成功'
    else
      redirect_to new_candidate_path, info: '資料新增發生錯誤'
    end
  end
```
這邊的程式碼最主要是要做新增存取判斷用的

其中這行 `redirect_to new_candidate_path` 這樣的寫法有什麼問題? 通常會怎麼解決?

1. redirect_to  這段程式碼最主要是直接跳轉到想要的路徑 new_candidate_path，通常這方法並沒有什麼錯，但是可以有更好的方式去寫 '資料新增發生錯誤'
時，尤其是在填寫表單的判斷，如果原本填一大串的資料只是因為打錯了某樣不起眼的資料導致程式錯誤 redirect_to 直接幫你重新來過，這時心裡一定OS..又要重打了
，所以通常在這情況下 用render是種選擇，render :new 將原本的資料保留在之前宣告的 candidate_params 裡面，所以就可以不用再重把啦!


2. 你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?
如果使用 JavaScript 其實可以只是會有安全疑慮，前端的部分JavaScript 如果把它關掉就可以通過檢查，Controller雖然看不到但是有點麻煩在MVC架構中Controller 
負責管理資料送給 Model 存進資料庫裡，而若不同的  Controller 要傳進資料給Model時但他們是要同樣的判斷就必須在 Controller 中寫兩遍而且看起來複雜，那還不
如寫在 Model 反正最後彙整進資料庫一次給他判斷的夠!


3. 什麼是 N + 1 問題，在 Rails 通常怎麼解決?

在資庫查詢中常見這樣問題，會進行N次的SELECT 10次會有一次是user 這樣就11個 ，通常用bullet 來偵測  使用includes 在controller中加上
什麼.includes(:car).page(params[:page])之類的 一次跑完要查詢的筆數。 
