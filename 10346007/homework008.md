1.其中這行 redirect_to new_candidate_path 這樣的寫法有什麼問題? 通常會怎麼解決?
  會將網頁重新整理，導致原本輸入的資料全部清空，所以要將原本的資料做儲存
2.你認為為什麼 Rails 的資料驗證是寫在 Model，而不是單純使用 JavaScript 或是在 Controller 裡檢查?
  如果使用JavaScript某些情況下容易被忽略驗證，放在Controller會使程式碼複雜化，所以寫在Model可以更方便取得也容易理解。

3.什麼是 N + 1 問題，在 Rails 通常怎麼解決?
  會產生過多的資料庫查詢筆數，導致消耗大量不必要的記憶體；Rails可以用include方法解決，include會先將所有資料回傳，再將所有資料做一次性的查詢。
