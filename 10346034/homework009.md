+Q1.在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?
 +A1.resources :users 方法可以便利做出 CRUD 相對應的路由，這方法會做出 8 個路由對應到 CRUD 相關的 7 個方法 
 +   resource :user 只會做出 7 個不同的路由除了沒有帶有 id 之外，也沒有 index。
 +   
 +Q2.在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?
 +A2.使用 member 方式產生的路徑，會帶有 :id 在裡面，這個 :id 會傳到 Controller 裡變成 params 這個變數的一部份。
 +   使用collection不用:id 且適用在多筆資料。
