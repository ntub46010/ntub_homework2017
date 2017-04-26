一、在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?
1.Resources
    a.系統管理員可以檢視、更新、刪除每個使用者的 profile
    b.會有:id 的路徑

2.Resource
   a.使用者只能檢視、更新、刪除自己的 profile
   b.沒有:id 的路徑



二、在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?

1.member 跟 collection，兩者差異為『產生路徑方式不同』，差異如下：
   使用member，產生之路徑會帶有『:id』，除此之外，會多一個/cancelled 的路徑，並且指向 #cancelled 的 Action

2.在下列情況中，分別使用member或 collection，情況如下：
  a.有:id的路徑→使用member；沒有:id的路徑→使用collection
  b.單筆資料→使用membe；複數資料、無資料→使用collection

