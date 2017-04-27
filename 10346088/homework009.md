# 作業 009

請閱讀[第 11 章](http://railsbook.tw/chapters/11-routes.html)後，回答以下問題：

1. 在 Rails 的 `config/routes.rb` 檔案中，`resources :users` 跟 `resource :user` 有何不同?

* Rails 的 `resources` 方法：

```
  Rails.application.routes.draw do
    resources :users
  end
```

* 一行 `resources :users`，Rails 會產生 8 條不同的路由並且對應到 `Controller` 的 7 個方法 (index, create, new, edit, show, update, destroy)

* Rails 提供(單數)的 `resource`  方法跟複數的 `resources` 方法，主要差別在於單數的 `resource` 方法僅會造出 7 條不同的路由並且對應到 `Controller` 的 6 個方法 (create, new, edit, show, update, destroy)，和複數的 `resources` 比起來，單數的路徑除了沒有帶 `id` 之外，`Controller` 的方法也沒有 `index` 。

* 舉例來說，像是會員個人 profile，如果想要設計為「使用者只能檢視、更新、刪除自己的 profile」的效果就可使用單數 resource，網址就會長得像 `/profile` ，但如果想要設計的是「系統管理員可以檢視、更新、刪除每個使用者的 profile」的話，則需使用複數 `resources`，網址就會像這樣 `/profiles/2` ，可以指定要處理那一筆使用者的資料。

-----
2. 在 Rails Route 的寫法中，`member` 跟 `collection` 有何不同? 該在什麼時候使用哪一種?

* 如果除了原 CRUD 外，還想要加上「確認訂單」或是「取消訂單」之類更改訂單狀態的路徑，可使用 `collection` 或是 `member` 方法。

* 如果想要可以檢視所有「已經取消的訂單」，可以使用 `collection` 方法做出這個效果：

```
  Rails.application.routes.draw do
    resources :orders do
      collection do
        get :cancelled
      end
    end
  end
```

把 `collection` 包在 `orders` 這個 `Resources` 裡，這樣的寫法除了會產生原有 8 條不同的路由並且對應到 `Controller` 的 7 個方法 (index, create, new, edit, show, update, destroy)外，還多了一個 `/orders/cancelled` 的路徑，並且指向 `orders#cancelled` 這個 `Action`。

* 使用 `member` 跟 `collection` 有點類似，就是在 `orders` 這個 `Resources` 裡加上 `member`：

```
  Rails.application.routes.draw do
    resources :orders do
      member do
        post :confirm
        delete :cancel
      end
    end
  end
```

這樣一來會產生以下路徑：

```
       Prefix Verb   URI Pattern                   Controller#Action
confirm_order POST   /orders/:id/confirm(.:format) orders#confirm
 cancel_order DELETE /orders/:id/cancel(.:format)  orders#cancel
```

使用 `member` 方式產生的路徑，會帶有 `:id` 在裡面，這個 `:id` 會傳到 `Controller` 裡變成 `params` 這個變數的一部份。

-----
## 注意事項：

1. 請新增檔案 `homework009.md` 到個人資料夾中，並發 PR 至 `homework/009` 分支。
2. 請詳閱首頁的作業繳交[注意事項](https://github.com/kaochenlong/ntub_homework2017/blob/master/README.md)。

## 繳交期限：2017/4/27 23:59 前
