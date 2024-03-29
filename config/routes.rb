Rails.application.routes.draw do
  resources :posts
  root "users#login"
  
  # posts
  post "posts/create" => "posts#create" 
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"

  # users
  get "signup" => "users#new"
  get "users/create" => "users#create"
  post "users/create" => "users#create"
  get "users/index" => "users#index"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "logout" => "users#logout"

  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  # likes
  resources :posts do
  resource :likes, only: [:create, :destroy]
  end

  # home
  get "/"  => "home#top"

end
