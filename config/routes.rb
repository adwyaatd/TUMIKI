Rails.application.routes.draw do

 root 'home#top'

  get "/" => "home#top"
  get "/about" => "home#about"

  resources :posts ,shallow: true do
    resources :likes  do
    end
  end
 
  resources :users do
    member do
      get :likes
      get :goals
    end

    collection do
      post :posts_create
      get :signup
      get :login_form
      post :login
      post :logout
    end
  end
  
  resources :goals do
    member do
      post :done
      post :unfinish
      get :reset
      post :recreate
    end

    collection do
      get :record
    end
  end

 post "/likes/:post_id/create" => "likes#create"
 post "/likes/:post_id/destroy" => "likes#destroy"

  resources :tasks do
    member do
      post :done
      post :unfinish
    end
  end

  resources :rules

#   get "/posts/index" => "posts#index"
#   get "/posts/:id/new" => "posts#new"
#   post "/posts/:id/create" => "posts#create"
#   get "/posts/:id" => "posts#show"
#   get "/posts/:id/edit" => "posts#edit"
#  post "/posts/:id/update" => "posts#update"
#  post "/posts/:id/destroy" => "posts#destroy"

#  get "/goals/:id/set_goal" => "goal#set_goal"
#  post "/goals/:id/create_goal"=>"goal#create_goal"
#  get "/goals/:id/edit_goal" => "goal#edit_goal"
#  post "/goals/:id/update" => "goal#update"
#  get "/goals/:id/record" => "goal#record"
#  post "/goals/:id/done" => "goal#done"
#  post "/goals/:id/unfinish" => "goal#unfinish"
#  get "/goals/:id/reset" => "goal#reset"
#  post "/goals/:id/recreate" => "goal#recreate"

#  get "/tasks/:id/new" => "tasks#new"
#  get "/tasks/:id/edit" => "tasks#edit"
#  post "/tasks/:id/create" => "tasks#create"
#  post "/tasks/:id/destroy" => "tasks#destroy"
#  post "/tasks/:id/done" => "tasks#done"
#  post "/tasks/:id/unfinish" => "tasks#unfinish"
#  get "/tasks/:id" => "tasks#index"
#  post "/tasks/:id/update" => "tasks#update"


end