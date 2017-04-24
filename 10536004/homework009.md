# 作業 009
1. 在 Rails 的 `config/routes.rb` 檔案中，`resources :users` 跟 `resource :user` 有何不同?
    * resources :users 做出8條路由，對應到users_Controller 的7個方法，在edit、show、update、destroy會有id包含在路徑裡
    * resource :user 做出7條路由，少了對應到index action的路由，在edit、show、update、destroy 路徑不包含id
    * 主要差別在於id的部分
        * 當假設限制使用者只能檢視、編輯、更新、刪除自己的資料→使用resource(無id)
        * 當有需求要看到所有的使用者資料，並且個別做編輯、更新、刪除→resources(有id)(路徑上看的到目前是哪個id)
2. 在 Rails Route 的寫法中，`member` 跟 `collection` 有何不同? 該在什麼時候使用哪一種?  
    當想做7個方法以外的動作的時候(想自訂路由)，不想在action內作判斷，可以使用memeber和collection作出新的action來處理
    * member和collection差別是member有id，會傳到controller當作參數(需要參數)，collection則無
    * 當要單個使用者進行操作時用member，多個是用collection，像是複數資料或無參數
    
