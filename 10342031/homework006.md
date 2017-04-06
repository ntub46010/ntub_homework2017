# 作業 006

1. 在作業 003 中曾經請大家解釋 MVC 的運作原理，現在請再次用你自己的話，說明 Rails 裡的 MVC 大概是怎麼運作的? (若使用英文作答可另外加分)

A browser sends a request to the routing.The router receives the request and redirects to controller.

The controller takes over.Sometimes controller render a view for the browser,others interacts with the model.

After finishing the detabase,the controller renders the final view and returns the complete page to the browser.

Models talk to the detabase and validate deta.Views are what users see.
