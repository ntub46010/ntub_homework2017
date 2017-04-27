1.在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?

A:
resources :users 跟 resource :user主要差在單數的路徑沒有帶有 id 之外，也沒有 index。
如果想要設計「使用者只能檢視、更新、刪除自己的 profile」的效果就可使用單數 resource。
反之如果想要設計的是「系統管理員可以檢視、更新、刪除每個使用者的 profile」的話，則使用
複數 resources。

2.在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?

A:
member 跟 collection 不同在於，使用 member 方式產生的路徑，會帶有 :id 在裡面，這個 :id 
會傳到 Controller 裡變成 params 這個變數的一部份。而 collection 則沒有 :id。

使用 collection：想要可以檢視所有「已經取消的訂單」
使用 member：想要「確認第 2 號訂單」或是「取消第 3 號訂單」
