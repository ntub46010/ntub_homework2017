### 請用「自己的話」並舉例說明 Rails 的 Scaffold 指令幫你完成了哪些事？

─ 假設建立「新增使用者基本資料」之專案 
  
  (rails g scaffold info name age tel )
```ruby
invoke  active_record                                                                                                 
      create    db/migrate/20170504091355_create_infos.rb                                                                   
      create    app/models/info.rb                                                                                          
      invoke    test_unit                                                                                                   
      create      test/models/info_test.rb                                                                                  
      create      test/fixtures/infos.yml                                                                                   
      invoke  resource_route                                                                                                
       route    resources :infos                                                                                            
      invoke  scaffold_controller                                                                                           
      create    app/controllers/infos_controller.rb                                                                         
      invoke    erb                                                                                                         
      create      app/views/infos                                                                                           
      create      app/views/infos/index.html.erb                                                                            
      create      app/views/infos/edit.html.erb                                                                             
      create      app/views/infos/show.html.erb                                                                             
      create      app/views/infos/new.html.erb                                                                              
      create      app/views/infos/_form.html.erb                                                                            
      invoke    test_unit                                                                                                   
      create      test/controllers/infos_controller_test.rb                                                                 
      invoke    helper                                                                                                      
      create      app/helpers/infos_helper.rb                                                                               
      invoke      test_unit                                                                                                 
      invoke    jbuilder                                                                                                    
      create      app/views/infos/index.json.jbuilder                                                                       
      create      app/views/infos/show.json.jbuilder                                                                        
      create      app/views/infos/_info.json.jbuilder                                                                       
      invoke  test_unit                                                                                                     
      create    test/system/infos_test.rb                                                                                   
      invoke  assets                                                                                                        
      invoke    coffee                                                                                                      
      create      app/assets/javascripts/infos.coffee                                                                       
      invoke    scss                                                                                                        
      create      app/assets/stylesheets/infos.scss                                                                         
      invoke  scss                                                                                                          
      create    app/assets/stylesheets/scaffolds.scss          
```
* 使用Scaffold會自動建立MVC架構、路徑route.rb、Migration
* Views會產生index.html.erb、edit.html.erb、show.html.erb、new.html.erb、_form.html.erb、index.json.jbuilder、show.json.jbuilder、_info.json.jbuilder 
* Controllers會自動建立「顯示、新增、編輯、更新、刪除」等功能，當資料「新增、更新、刪除」成功後，會顯示notice，若失敗則render
