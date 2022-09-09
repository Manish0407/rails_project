Rails.application.routes.draw do
  devise_for :users

  resources :users, :homes, :books#, :book_issues
  resources :book_issues do
    member do
      get :student
    end
  end
  root "homes#index"
  get 'book_issue/record', to: 'book_issues#record' 
  get 'book_issue/myrecord', to: 'book_issues#myrecord'
  get 'book_issues', to: 'book_issues#index'
  post 'book_issues', to: 'book_issues#create'
  patch 'book_issue', to: 'book_issues#update'
  # get 'book_issues/student/:id', to: 'book_issues#student'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # post 'book_issue', to: 'book_issue#create'
end
