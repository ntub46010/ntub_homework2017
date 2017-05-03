<h1> 作業 010 </h1>

請用「自己的話」並舉例說明 Rails 的 Scaffold 指令幫你完成了哪些事?  

Scaffold指令幫我們做完以下這些事：  
* CRUD(Create新增、Read讀取、Update更新、Delete刪除)完整的路徑，幫忙做出8條路徑，分別對到index、create、new、edit、show、update、destroy。  
* 新增Controller，定義各個對應到的路徑之功能。  
* 新增Model，產生一個類似資料表架構的遷移檔，之後利用```rails db:migrate```指令將遷移檔執行在資料庫建一個我們所需要的資料表。  
* 新增View，將要顯示給使用者看的頁面建好。  
* 並將將各頁面所需的功能連結好。  
最後即可開啟終端機，透過瀏覽器就可看到一個利用Scaffold指令完成的具備新增、修改、刪除功能的網頁。
