簡易版：在連線至網站之前會遇到路徑對照表，之後會根據輸入的網址，比對路徑表的資料，依據資料找到相對的controller上的action，如果此action需要找資料庫的資料，可以透過model幫忙，從資料庫取得資料，顯示的工作交給view，轉換成適合使用者閱讀的介面。
first,install routes,than create Controller,definition Controller action,if action have to use data than it will go to model , let model 
go to database find data and go back to action ,least use View to show ,final user can see it on the websites 
