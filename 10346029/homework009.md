1. 在 Rails 的 `config/routes.rb` 檔案中，`resources :users` 跟 `resource :user` 有何不同?

    * 都會產生出8條不同的Routes並對應到Controller的7個方法，但唯一不同的是會由 `users_controller` 轉變成 `user_controller` ，重點是 `users` 變成 `user`。

2. 在 Rails Route 的寫法中，`member` 跟 `collection` 有何不同? 該在什麼時候使用哪一種?

    * `collection` 用來做大範圍的搜尋，而 `member` 適用於精準搜尋。兩者最大的差異在於 `member` 會有 `:id` 在裡面，傳到 `Controller` 當 `param` 用，因此 `member` 搜尋範圍才能縮小。

