Rails.application.routes.draw do

 root 'home#top'

  get "/" => "home#top"
  get "/about" => "home#about"
  get "/posts/index" => "posts#index"
  get "/posts/new" => "posts#new"
  post "/posts/create" => "posts#create"
  get "/posts/:id" => "posts#show"
  get "/posts/:id/edit" => "posts#edit"
 post "/posts/:id/update" => "posts#update"
 post "/posts/:id/destroy" => "posts#destroy"

 post "/users/:id/update" => "users#update"
 get "/users/:id/edit" => "users#edit"
 get"/users/:id/likes" => "users#likes"
 get"/users/:id/goals" => "users#goals"
 post "/users/create" => "users#create"
 get "/users/index" => "users#index"
 get "/users/signup" => "users#new"
 get "/users/:id" => "users#show"
 get "/login_form" => "users#login_form"
 post "/users/:id/posts_create" => "users#posts_create"
 post "/login" => "users#login"
 post "/logout" => "users#logout"

 get "/goals/:id/set_goal" => "goal#set_goal"
 post "/goals/:id/create_goal"=>"goal#create_goal"
 get "/goals/:id/edit_goal" => "goal#edit_goal"
 post "/goals/:id/update" => "goal#update"
 get"/goals/:id/record" => "goal#record"

 post "/likes/:post_id/create" => "likes#create"
 post "/likes/:post_id/destroy" => "likes#destroy"

 get "/tasks/:id/new" => "tasks#new"
 get "/tasks/:id/edit" => "tasks#edit"
 post "/tasks/create" => "tasks#create"
 post "/tasks/:id/destroy" => "tasks#destroy"
 post "/tasks/:id/done" => "tasks#done"
 post "/tasks/:id/unfinish" => "tasks#unfinish"
 get "/tasks/:id" => "tasks#index"
 post "/tasks/:id/update" => "tasks#update"

 get "/rules/:id/new" => "rules#new"
 post "/rules/:id/create" =>"rules#create"
 post "rules/:id/update" => "rules#update"
 get "/rules/:id/edit" => "rules#edit"
 post "rules/:id/destroy" => "rules#destroy"
 
end
