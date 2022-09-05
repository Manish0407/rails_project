Rails.application.routes.draw do
  devise_for :users

  resources :users, :homes, :books, :book_issues
  root "homes#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # post 'book_issue', to: 'book_issue#create'
end
