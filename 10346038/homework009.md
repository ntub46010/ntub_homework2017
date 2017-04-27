在 Rails 的 config/routes.rb 檔案resources :users 跟 resource :user 有何不同?

這是 Rails 的個命名慣例，產生出得路徑一樣是 8 個路由對應到controller相關的 7 個方法，但resources :users 會對到 users_controller ，而  resource :user  會對應到user_controller。



在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?

當Resources 內建的路徑不夠用時可使用，使用 member 方式產生的路徑會有 :id ，這個 :id 會傳到 Controller 裡變成 params 變數的一部份。

