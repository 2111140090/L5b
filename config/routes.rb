Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :users
  root "tweets#index"
  resources :tweets
  post 'top/login'
  get 'top/logout'
  post 'top/logout'
  get 'top/main'
  get 'top/login_form'
  post "likes/create"
  get "likes/destroy"
  get "top/login_check"
end
