*****使用Scaffold會產生Routes、Model、Controller、View、db

******Routes

         users GET    /users(.:format)               users#index                                                                                                                                                      
               POST   /users(.:format)               users#create                                                                                                                                                     
      new_user GET    /users/new(.:format)           users#new                                                                                                                                                        
     edit_user GET    /users/:id/edit(.:format)      users#edit                                                                                                                                                       
          user GET    /users/:id(.:format)           users#show                                                                                                                                                       
               PATCH  /users/:id(.:format)           users#update                                                                                                                                                     
               PUT    /users/:id(.:format)           users#update                                                                                                                                                     
               DELETE /users/:id(.:format)           users#destroy   
               
*****Controllers >>>>> users_controller.rb

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

     裡面會有 index、 show、 new、edit、 
             create、update、destroy（內有html view的基本判斷、json紀錄)、
             user_params

******models >>>>>user.rb

******views >>>>>users
       裡面分別有index show new edit對應的.html.erb
       
******db >>>> migrate
      會產生出指定的資料格式，並且migrate
