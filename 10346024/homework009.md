1. `resources :users`與`resource :users`都會產生路徑，差異在於`resources :users`會產生八條路徑；而`resource :users`只會產生七條路徑，缺少`index`路徑並且其他路徑也缺少 :ID的部分。  
`resource :users`通常使用在例如：「使用者檢視」這種比較小區塊的部分。
2.  `member` 跟 `collection`同樣都能夠在Rails Route中額外建立路徑，但是`collection`所建立的路徑不包含 :ID而`member`則會建立 :ID。  
當建立的路徑是為了檢視比較大量的資料時通常會使用`collection`，而如果是為了檢視、修改比較小量或單一的資料時就比較適合使用`member`建立路徑。
