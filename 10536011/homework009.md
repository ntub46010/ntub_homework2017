# 作業 009

請閱讀第 11 章後，回答以下問題：

#### 在 Rails 的 ```config/routes.rb``` 檔案中，```resources :users``` 跟 ```resource :user``` 有何不同?  
```resources :users``` Rails會自動做出8條不同的路由並且對應到Controller的7個方法，則```resource :user```會做出7條路由，差別在沒有做出```:id```的路徑和沒有index。  

#### 在 Rails Route 的寫法中，```member``` 跟 ```collection``` 有何不同? 該在什麼時候使用哪一種?  
1. ```member```和```collection```的不同在，使用```member```方式產生的路徑會帶有```:id```在裡面，會傳到Controller裡變```params```這個變數的一部份，```collection```則沒有帶```:id```。  
2. ```collection```用在多筆資料時，```member```則用在單筆的時候。
