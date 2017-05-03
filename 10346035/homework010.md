Rails的Scaffold指令可以直接幫你建立好相關的Model、Controller、View，就不用自己一個一個的分別建立
例如打 rails g scaffold student name:string email:string ，這時候就會直接幫你建立好student的Model、Controller、View，可以新增、修改、讀取、刪除，但是有個缺點是他會一次幫你全部建立好，有些你不需要的，他也建立了
