1.使用resources :users會做出8條不同的路由並且對應到Controller的7個方法，而resource :user只會做出7條不同的路由而且不會做出含有 :id 的路徑
2.使用collection和使用member做出來的路徑會不一樣，使用member方法產生路徑的時候，會有 :id，這個 :id 會傳到 Controller 裡變成 params 這個變數的一部份，而collection用在複數資料，member則是用在對單筆資料
