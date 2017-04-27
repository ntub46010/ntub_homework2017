# 在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?
  resources :users 跟 resource :user 這兩個差別在於有沒有系統管理員，沒有s我想就只有純粹單機模式吧! 有了s就會有:id，有點像多人模式


# 在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?
  1. member 跟 collectio 這兩個有點像，只差在有沒有:id
  2. 使用member時機大概就是想要單獨查看特定id 的資料火勢修改編輯，甚至可以進到 Controller 裡變成 params 變數的判斷
     collection 感覺上因為沒ID所以一次就是收集一大堆資料。
  
