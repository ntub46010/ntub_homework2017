# Controller
  Controller會根據URL找到正確的Model，並將Model處理完的資料傳給View。
# View
  呈現給使用者看的頁面。
# Model
  跟資料庫溝通的地方，例如：資料的新增、修改、刪除、搜尋。
# 流程
  使用者輸入URL後，Controller根據此URL導向Model，若URL為正確則導向正確的Model不正確會出現HTTP 404。
  進入Model後會做資料的處理，例如：搜尋資料…等，Model處理完後，會將處理完的資料丟給Controller，並將他丟給View。
  最後View接到值便呈現給使用者看。
  
