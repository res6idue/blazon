Rails.application.routes.draw do
  get "relationship/create", to: "relationship#create", as: "relationship_create"
  get "users/profile/:id", to: "users#edit", as: "users_edit"
  put "users/profile/:id", to: "users#update", as: "users_update"
  get "users", to: "users#index", as: "users_index"
  get "likes/:id", to: "blazos#like", as: "blazo_like"
  get "relationships/:id", to: "users#follow", as: "user_follow"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :blazos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "blazos#index"
  
end