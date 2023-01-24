Rails.application.routes.draw do
  get 'relationship/show'
  get 'relationship/create'
  get 'relationship/delete'
  get 'likes/show'
  get 'likes/create/:id', to: 'likes#create', as: 'likes_create'
  get 'likes/delete'
  devise_for :users
  resources :blazos
  resources :users, only: [:show, :update, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "blazos#index"
end