# Rails 裡的 MVC 運作


## 大致分為


- Views
- Controllers
- Models

## 其實也就是


- 人看得懂，前端在做的事
- 控制流程，怎麼跑路徑之類
- 負責資料庫接收傳送的部分

> # 說明
>  當使用者開始使用網址時會先進到 Route 裡比對位置有沒有正確
>  再來會到     Controller 中尋找有沒有對的動作，如果純粹只是一般呼叫index
那就只會到View裡抓對應的index
```sh
class CandidatesController < ApplicationController
  def index
  end
end
```
***
>但有可能在 Controller 中的動作 (action)中需要用到資料也就是會跟資料庫有關的時候
>那就會到 Model去詢問 model會自動幫我們跟資料庫要資料然後再傳給我們以
>但因為看不懂，所Model會幫我們解釋，然後再丟給View做包裝
>我們就可以看到我們想看到的資料了
