## 1.resources :users 做出 8 條不同的路由並且對應到 CRUD 的 7 個方法， resource :user 方法只會做出 7 個不同的路由(少了index)，不會做出含有 :id 的路徑。
## 2.2.使用collection和使用member做出來的路徑會不一樣，使用member方法產生路徑的時候，會有 :id，這個 :id 會傳到collection裡變成 params 這個變數的一部份。collection適用在多筆資料，而member則用在單筆
