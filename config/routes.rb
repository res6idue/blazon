Rails.application.routes.draw do
  get 'relationship/create', to: 'relationship#create', as: 'relationship_create'
  get 'users/:id', to: 'users#update', as: 'users_update'
  get 'likes/show', to: 'likes#show', as: 'likes_show'
  get 'likes/create/:id', to: 'likes#create', as: 'likes_create'
  devise_for :users
  resources :blazos
  resources :users, only: [:update, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "blazos#index"
end