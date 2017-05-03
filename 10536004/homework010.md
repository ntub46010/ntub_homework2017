# 作業 010

請用「自己的話」並舉例說明 Rails 的 Scaffold 指令幫你完成了哪些事?  
  快速建立一個網站(假設是user專案)

  * 建立完整的MVC
  * 建立資料庫的資料表在db/migrate下面xxxxxxxxxxxxxx_create_users.rb和model的user.rb負責連接資料庫  
  * 建立路由routes.rb 裡面新增user的路由，包含CRUD，像是resources :users  
  * 建立users\_controller，裡面包含完整的CRUD 的 action
  * 建立view，顯示畫面的html包含index、show、new、edit、\_form，action會用到的畫面  
  * 新增view helps和其他test的東西和它已預先寫好的css樣式  

簡單來說就是可以快速建立基本功能的網站，路由位置、csss樣式都設定好預設，除了資料和美化之外，基本的網站功能CRUD、框架都已經完成
