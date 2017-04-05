# 作業006
1. 在作業 003 中曾經請大家解釋 MVC 的運作原理，現在請再次用你自己的話，說明 Rails 裡的 MVC 大概是怎麼運作的? (若使用英文作答可另外加分)<br />
Ans:<br />
當使用者輸入網址後，會先碰到Route,Route會根據使用者所輸入的參數或網址,選擇要到哪個Controller,使用哪個Action,<br />
當到達該Action時,Action就會要我們做一些事,若是要從資料庫取資料,則需透過Model跟資料庫溝通,<br />
最後將Controller與取回來的資料放入View呈現.<br />

英文不好,但試試看<br />

After users enter the URL,the first step is to going Route.<br />
According to the parameters or URL which entered by the user,Route will choose to go to which Controller and Action.<br />
When arrived Action,Action will do something.<br />
If we need to get data from the database,we must use Model to communicate with database.<br />
At last,put Controller/Action and data in View then show users.
