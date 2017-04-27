1.在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?
resources :users 會有8個不一樣的路由對應到users_Controller的7個方法，資源是複數，可以檢視、更改或刪除每個使用者的 profile，所以路徑帶有id 
resource :user 只有7個路由，跟resources :users相比少了index，資源是單數，只能變更使用者，所以路徑沒有id
主要差別在於id的部分
2.在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?
member和collection差別是member有id，會傳到controller當作參數(需要參數)，collection則無。
他們所做出來的路徑不同，使用member的路徑會帶有id，collection的路徑則沒有id member是自定特定元素路由，用在單數資料上。
collection是自定群集路由，用在複數資料上。
