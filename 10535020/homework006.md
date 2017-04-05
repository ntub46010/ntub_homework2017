在自己架構view時，讓我知道要先建立一個rotues,接著建立Controller,建立類別時要大寫且中間不能有底線,再來建立action,action建立完之後,如果需要用到資料庫的資料，就會再跳到model撈資料，之後再去view資料夾下,建立和controller動作一樣的html.erb檔,erb顧名思義就是可以直接在裡頭輸入ruby程式碼,在這個檔案裡,就可輸入文字或語法,最後在跑到container按左鍵,到inf.裡點https的網址就可以顯示在html.erb檔所輸的內容了。
簡易版：在連線至網站之前會遇到路徑對照表，之後會根據輸入的網址，比對路徑表的資料，依據資料找到相對的controller上的action，如果此action需要找資料庫的資料，可以透過model幫忙，從資料庫取得資料，顯示的工作交給view，轉換成適合使用者閱讀的介面。
first,install routes,than create Controller,definition Controller action,if action have to use data than it will go to model , let model 
go to database find data and go back to action ,least use View to show ,final user can see it on the websites 
