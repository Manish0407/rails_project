Rails.application.routes.draw do
  devise_for :users
  resources :users, :homes, :books
  root "homes#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # get 'homes', to: 'homes#index'
end
