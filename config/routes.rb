Rails.application.routes.draw do
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

  # likes
  resources :posts do
  resource :likes, only: [:create, :destroy]
  end

  # home
  get "/"  => "home#top"

end
