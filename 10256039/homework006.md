# 作業 006

1. 有一個路由檔案 (config/routes.rb) 會依照使用者請求的網址以及方法 (get, post, put....) 判斷該交給哪個 controller 的 action 處理

2. controller 的 action 會視情況判斷是否需要調用 model 提取資料，再將從 model 提取出來的資料 (如果有的話) 與畫面做結合

3. 最後將結合好的 view 呈現給使用者
