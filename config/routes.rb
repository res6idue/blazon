Rails.application.routes.draw do
  get 'relationship/create', to: 'relationship#create', as: 'relationship_create'
  get 'users/profile/:id', to: 'users#edit', as: 'users_edit'
  put 'users/profile/:id', to: 'users#update', as: 'users_update'
  get 'likes/create/:id', to: 'blazos#like', as: 'blazo_like'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :blazos
  resources :users, only: [:update, :destroy, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "blazos#index"
  
end