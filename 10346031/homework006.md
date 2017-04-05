When a user makes a request to a web page, rails passes the request to routing.  
Then routing will be based on Route.rb query the action controller of correspond requests ,and then action controller will find its corresponding model to implement it.  
After the model completes the work, it will return the extracted data to the controller ,and then the controller will send the page request to the view.  
When the view will return the results of the request to the controller ,and after the controller sorted it.  
It will send to the routing and then response the user's request.  
