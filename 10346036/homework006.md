當收到表單資料時，Route會根據路徑選擇相對應的Controller/Action。 
如果Action要查詢資料，會通知Model，Model將查詢需求轉換成SQL語言，從資料庫取得資料後，再傳回給Action。 
Action再找View取得檔案畫面，將資料和畫面結合之後呈現在網頁上。
