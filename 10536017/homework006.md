※MVC說明
1.使用者在瀏覽器發出HTTP request請求給伺服器的Rails，request分為4種，分別為讀取 
  (Read)、新增(Create)、更新(Update)、刪除(Destroy)。	
2.路由(Routing)收到瀏覽器端的請求(request)，並根據收到的使用者輸入的網址及參數，找
 到對應的路徑，傳送給Controller(控制器)。
3.Controller(控制器)收到請求後，會根據此請求，找到對應的方法(Action)，並判斷是否需
 要資料庫中的資料，再執行此方法。
4.若需要資料庫中的資料，會先透過Model(模型)，將收到的請求，轉換成資料庫看得懂
 的資料庫查詢語言（SQL）。
5.透過資料庫查詢語言，找到資料庫中，對應的資料(Database)，回傳給Controller。
6.Controller再根據回傳的資料內容及輸出的指令，利用View(樣板)，將資料美化。
7.最後，再將美化過後的資料，呈現給使用者瀏覽。
