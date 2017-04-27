# 作業 009

請閱讀[第 11 章](http://railsbook.tw/chapters/11-routes.html)後，回答以下問題：

#### 1. 在 Rails 的 `config/routes.rb` 檔案中，`resources :users` 跟 `resource :user` 有何不同?

差異在於`resources :users`會產生八條路由，`resource :user`則是七條，缺少的是`index`，另外路徑也會少了`id`


#### 2. 在 Rails Route 的寫法中，`member` 跟 `collection` 有何不同? 該在什麼時候使用哪一種?

使用`member`方式，有`:id`在裡面，而且這個`:id`會傳到Controller裡變成`params`變數的一部份

`member`以一般單字解釋是成員或是某個東西的一部份，`collection`解釋成一個集合、一個群體

所以，`member`常用於找某個大集合裡的一樣物品(例如在一堆已成立的訂單中，找編號5的訂單)，`collection`則是一整個群體(例如一堆已成立的訂單)
