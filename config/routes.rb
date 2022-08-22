Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :homes
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  # get 'homes', to: 'homes#index'
  # get 'book/index'
  # get '/book/new', to: 'book#new'
end
