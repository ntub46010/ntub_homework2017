1. 在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?
   A: resources :users會產生8條不同的路由並對應到Controller的7個方法；resource :user不會有:id的路徑，只會產生7條不同的路由。
   
   
2. 在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?
   A: member方法產生路徑時，帶有:id，並傳到Controller當params變數的一部份；collection方法沒有:id。
      collection適用於多筆(複數)資料，member適用於單筆資料(單數)。
