Q1.在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?

A:resources :users 做出 8 條不同的路由並且對應到 Controller 的 7 個方法，則 resource :user 方法只會做出 7 個不同的路由，不會做出含有 :id 的路徑。

Q2.在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?

A:member需要:id，collection不用:id。
  使用member方法產生路徑的時候，會帶有 :id，這個 :id 會傳到 Controller 裡變成 params 這個變數的一部份;使用collection方法時則不用:id。
  collection 通常用於對複數資料、無資料的操作，member則是對單筆資料做操作的情況下使用。
