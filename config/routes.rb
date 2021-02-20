Rails.application.routes.draw do
# home
  root "home#top"

# users
  get "signup" => "users#new"
  get "users/create" => "users#create"
  post "users/create" => "users#create"
  get "users/index" => "users#index"
  post "login" => "users#login"
  post "logout" => "users#logout"

# posts
  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/:id/create" => "posts#create"
  post "posts/:id/destroy" => "posts#destroy"


end
