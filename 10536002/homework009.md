作業 009  

請閱讀第 11 章後，回答以下問題：  

在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?  
resources :users會對到 users_controller
resource :user會對到 user_controller，單數 resource 方法不會做出含有 :id 的路徑
  
  
在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?  
使用 member和collection 方法做出來的路徑有點不同，使用 member 方式產生的路徑，會帶有 :id 在裡面，這個 :id 會傳到 Controller 裡變成 params 這個變數的一部份。  
member使用在特定某筆資料的時候，collection使用在多筆或是不特定的時候
