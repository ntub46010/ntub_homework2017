### 在 Rails 的 config/routes.rb 檔案中，resources :users 跟 resource :user 有何不同?
使用 user 或 users 只是一種命名慣例， resource 配單數、 resources 配複數。<br>
resources 產生的路由有完整8條。而 resource 只有7條(少了 index 的方法)，且路徑不會包含 :id 。<br>
resources 可透過傳遞參數來存取多項資料中指定的某一個(配複數)，而 resource 不行(配單數)。<br>

<br>

### 在 Rails Route 的寫法中， member 跟 collection 有何不同? 該在什麼時候使用哪一種?
使用 member 產生的路徑，會需要傳遞參數( :id )給 Controller 。<br>
collection 則不，但依實作方式仍有可能傳遞「條件」的參數，如 type=cancelled 。<br>
若要存取指定某項資料，使用 member ；若要存取一批符合某條件的資料，使用 collection。<br>
