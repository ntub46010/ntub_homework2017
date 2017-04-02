使用者輸入網址送出要求，經由Route對照路徑找到某個指定的Action  Controller，當有需要的資料時Controller會向Model要求資料，Model透過SQL從資料庫直接取得資料並回傳給Controller，controller會將從model取得的資料傳給view，view將資料美化後以網頁給使用者觀看。

The user sends the request from typing a URL into the address bar. The Route will match the URL path to find a specific Action Controller. The Controller asks for the data from the Model. The Model uses SQL to get the data directly from data base and return to the Controller. The Controller will transfer the given data from the Model to the View. The View show the data to the user through web page after embellish.
