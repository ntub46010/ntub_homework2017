Q：請用「自己的話」並舉例說明 Rails 的 Scaffold 指令幫你完成了哪些事?

A：Scaffold可以自動產生需要的程式碼及檔案，包括Controller、Model、View，藉以快速建立擁有新增、讀取、更新、刪除功能的CRUD模板。
   
   例如：rails g scaffold Book title:string content:text price:integer
   
   invoke  active_record
      create    db/migrate/20170504133021_create_books.rb
      create    app/models/book.rb
      invoke    test_unit
      create      test/models/book_test.rb
      create      test/fixtures/books.yml
      invoke  resource_route
       route    resources :books
      invoke  scaffold_controller
      create    app/controllers/books_controller.rb
      invoke    erb
      create      app/views/books
      create      app/views/books/index.html.erb
      create      app/views/books/edit.html.erb
      create      app/views/books/show.html.erb
      create      app/views/books/new.html.erb
      create      app/views/books/_form.html.erb
      invoke    test_unit
      create      test/controllers/books_controller_test.rb
      invoke    helper
      create      app/helpers/books_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/books/index.json.jbuilder
      create      app/views/books/show.json.jbuilder
      create      app/views/books/_book.json.jbuilder
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/books.coffee
      invoke    scss
      create      app/assets/stylesheets/books.scss
      invoke  scss
   identical    app/assets/stylesheets/scaffolds.scss   
   
   快速create了MVC裡的檔案也定義了其內容，裡頭包括
   Controller=>books_controller.rb
   Model=>book.rb
   View=>index.html.erb & edit.html.erb & show.html.erb & new.html.erb & _form.html.erb
   helper也有create一個books_helper.rb，另外還有create一些其他所需檔案
   
   
   路由規則也可以快速設定，對應其CRUD的功能
   books GET    /books(.:format)               books#index
               POST   /books(.:format)               books#create
      new_book GET    /books/new(.:format)           books#new
     edit_book GET    /books/:id/edit(.:format)      books#edit
          book GET    /books/:id(.:format)           books#show
               PATCH  /books/:id(.:format)           books#update
               PUT    /books/:id(.:format)           books#update
               DELETE /books/:id(.:format)           books#destroy
