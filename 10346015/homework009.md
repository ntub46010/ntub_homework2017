1.在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?

  A：resources :users 會有8個不一樣的路由對應到7個方法，因資源是複數，可以檢視、更改或刪除每個使用者的 profile，所以路徑帶有id 
     resource :user 只有7個路由，跟resources :users相比少了index，也因為是單數，只能變動使用者本身，所以路徑沒有id
   
2.在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?

  A：member跟collection所做出來的路徑不同，使用member的路徑會帶有id，這個id會傳到Controlle裡的params變數，collection的路徑則沒有id
     member是自定特定元素路由，用在單數資料上。collection是自定群集路由，用在複數資料上。
