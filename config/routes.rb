Rails.application.routes.draw do
  devise_for :users

  resources :users, :homes, :books, :book_issues
  root "homes#index"
  get 'book_issue/record', to: 'book_issues#record' 
  get 'book_issue/myrecord', to: 'book_issues#myrecord'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # post 'book_issue', to: 'book_issue#create'
end
