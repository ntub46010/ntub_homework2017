# 作業 010

請用「自己的話」並舉例說明 Rails 的 Scaffold 指令幫你完成了哪些事?
Create(新增), Read(讀取), Update(更新) 跟 Delete(刪除)
Scaffold可以快速完成CRUD這幾項動作

以上課教學的候選人資料表來舉例

第一步先修改Route 做出路徑
```ruby
Rails.application.routes.draw do
  resources :users 
  resources :candidates do
    member do
      post :vote
    end
  end
end
```
第二步 新增 Controller，在終端機輸入`rails generate controller candidates`

第三步 新增 Model，在終端機輸入`rails generate model candidate name party age:integer politics:text votes:integer`，
新增 Model後，再轉換成真正的表格(使用Scaffold 指令也要做)，在終端機輸入`rails db:migrate`

第四步 新增 View，有了前面的東西之後要做出頁面。
因為候選人資料需要一個列表和新增、修改的功能，所以在`app/views/candidates`下新增三個檔案，分別是`index.html.erb`、`new.html.erb`、`edit.html.erb`

第五步 頁面的呈現需要從資料表抓出資料，從 Controller下手，先到`app/controllers/candidates_controller.rb`
```ruby
 class CandidatesController < ApplicationController
    def index
      @candidates = Candidate.all
    end
  end
```
然後要呈現出表單，所以修改`index.html.erb`
```ruby
<h1>Candidate List</h1>

<%= link_to "add candidate", new_candidate_path, class: "btn btn-success btn-xs" %>

<table class="table table-hover table-condensed">
  <thead>
  <tr>
    <td></td>
    <td>Name</td>
    <td>Votes</td>
    <td>Age</td>
    <td>Politics</td>
    <td></td>
   </tr>
  </thead>
  
  <tbody>
  <% @candidates.each do |candidate| %>
  <tr>
    <td><%= link_to "vote!", vote_candidate_path(candidate), class: "btn btn-xs btn-danger", data: { confirm: "Vote this one?!" }, method: "post" %></td>
    <td><%= link_to display_name(candidate), candidate %></td>
    <td><%= candidate.logs.count %></td>
    <td><%= candidate.age %></td>
    <td><%= candidate.politics %></td>
    <td>
     <%= link_to "edit", edit_candidate_path(candidate), class: "btn btn-success btn-xs"  %>
     <%= link_to "delete", candidate, method: "delete", data: { confirm: 'delete?!'}, class: "btn btn-danger btn-xs"  %>
    </td>
  </tr>
    <% end %>
  </tbody>
</table>
```
第六步 新增候選人資料
修改`new.html.erb`
```ruby
<h1>New Candidate</h1>
<%= render 'form', candidate: @candidate %>
```
到`app/controllers/candidates_controller.rb`新增new方法
```ruby
def new
    @candidate = Candidate.new
  end
 ```

