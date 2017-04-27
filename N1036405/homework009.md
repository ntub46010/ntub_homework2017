# 作業 009

請閱讀[第 11 章](http://railsbook.tw/chapters/11-routes.html)後，回答以下問題：

1. 在 Rails 的 `config/routes.rb` 檔案中，`resources :users` 跟 `resource :user` 有何不同?<br />
Ans:<br />
resource做出來的路徑會少resources一條路徑(少index)<br />
以及resource不會做出可以傳參數(:id)的路徑<br />

2. 在 Rails Route 的寫法中，`member` 跟 `collection` 有何不同? 該在什麼時候使用哪一種?<br />
Ans:<br />
menber產生的路徑可以帶參數(:id)<br />
如果是要看某個Action的內容的話使用collection(像是查看已出貨的訂單)<br />
如果是要看某筆資料的Action的內容的話使用member(像是查看已出貨的第二筆訂單)<br />

