# 作業 009

1. 在 Rails 的 `config/routes.rb` 檔案中，`resources :users` 跟 `resource :user` 有何不同?  
A: 單數 resource 方法不會做出含有 `id` 的路徑，對應到 controller 的名稱也會不同

2. 在 Rails Route 的寫法中，`member` 跟 `collection` 有何不同? 該在什麼時候使用哪一種?  
A: 使用 `member` 方式產生的路徑，會帶有 `id` 在裡面，如果要做的動作需要帶有 `id` 這個參數，就使用 `member` 反之使用 `collection`
