
```ruby
1.在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?
```
resources :users

Rails 會直接建立 8 條不同的路徑，然後有7種方法對應到 Controller，
而「所有」使用者可以看到使用者列表，並且進行檢視、編輯、刪除、更新等。

resource :user

Rails 會直接建立少了index且不含:id的 7 種路徑，並且對應user_controller，
使用者只能對自己的資料進行檢視、編輯、刪除、更新等。

```ruby
2.在 Rails Route 的寫法中，member 跟 collection 有何不同? 該在什麼時候使用哪一種?
```
若有其他執行需求、想要新增其他路徑(resource產生的路徑沒有的)，可使用 collection 或是 member。

member的路徑有id，collection則無。

使用者若要知道「所有」已確認或已取消訂單，用collection，若指定查看「某個」已確認或已取消訂單，則使用member。
