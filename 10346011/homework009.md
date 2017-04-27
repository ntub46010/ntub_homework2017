1. resources :users→做出 8 條不同的路由並且對應到 Controller 的 7 個方法。resources :user→只會造出 7 個路由，且單數路徑除了沒有帶有 id 之外，也沒有 index。
2. 使用 member 方式產生的路徑，會帶有 :id 在裡面，這個 :id 會傳到 Controller 裡變成 params 這個變數的一部份。
member→單數、帶有id，collection→複數、沒有id
