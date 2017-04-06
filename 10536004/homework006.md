# 作業 006

1. 在作業 003 中曾經請大家解釋 MVC 的運作原理，現在請再次用你自己的話，說明 Rails 裡的 MVC 大概是怎麼運作的? (若使用英文作答可另外加分)

   User enter the url to connect the website, then Rails check the url is correct and in the route.
	 Rails tell you which controller action, then action request model to take the data from database.
	 Next, get the style from view, then combine data and style to show to user
 
	 使用者輸入網址，Rails會去看你的網址的路徑是否正確、存在route 路徑表裡面，如果有，就會去對應的controller 上的 action 去做動作，向model去跟資料庫
	 撈資料，再向view把介面樣式帶進來，把資料和介面合在一起，呈現給user看
