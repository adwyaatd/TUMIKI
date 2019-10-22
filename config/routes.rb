Rails.application.routes.draw do
  get 'goal/set_goal'

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
 post "/login" => "users#login"
 post "/logout" => "users#logout"

 get "/goals/:id/set_goal" => "goal#set_goal"
 post "/goals/:id/create_goal"=>"goal#create_goal"

 post "/likes/:post_id/create" => "likes#create"
 post "/likes/:post_id/destroy" => "likes#destroy"

end
