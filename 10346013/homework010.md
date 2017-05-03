請用「自己的話」並舉例說明 Rails 的 Scaffold 指令幫你完成了哪些事?

  A : 使用Scaffold指令，會把新增、修改、刪除等功能一次做出來，完成一個簡易的CRUD程式。
      EX：打上rails g scaffold name:string email:string ，Scaffold指令就會在db/migrate目錄裡產生一個檔案，
      建立一個表格，表格的欄位有name及email。
