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
      get :tasks
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

  resources :tasks do
    member do
      post :done
      post :unfinish
    end
  end

  resources :rules
end