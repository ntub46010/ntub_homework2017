
1a.如果資料新增發生錯誤的時候這業你填的資都會被清空(等於重新開這頁)

1b.使用render
#
2.使用者可能把javaScript關掉,如果有一個金額的欄位,這樣新增和修改都要去判斷它大於0(重複),不如就直接寫在Model裡這樣只要判斷一次即可
#
3.以文章和留言的關係,一個文章有多筆留言
```ruby
Comment.each do |comment|
    comment.post.title
end
```
comment.post這段會對DB再做一次hit,很耗效能

所以應該使用includes方法,讓Comment一開始就和post做好關聯(?)
這樣comment.post就不會對DB hit了
```ruby
comments = Comment.includes(:post)
Comment.each do |comment|
    comment.post.title
end
```