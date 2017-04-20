1. 如果發生資料新增錯誤時，是使用redirect_to new_candidate_path的話，回到清空頁面已輸入的所有資料(包含正確資料也一同被清空)。
用render 'new'解決清空所有欄位的問題(只清空資料輸入錯誤的欄位)。

2. JavaScript驗證：如果關掉的話很容易跳過驗證程序(使用者自製表單將資料傳進DB)。
Controller驗證：需要重複驗證語法，導致程式很多很雜。
Model驗證：解決Controller重複語法的問題。

3. 如果要查10筆User ID，第一步會先是將10個User撈出來，再逐步去抓取User ID，因此是10+1(N+1)。
解決：使用 include (一次將資料取出查詢)。
