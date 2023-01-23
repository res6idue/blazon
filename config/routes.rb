Rails.application.routes.draw do
  devise_for :users
  resources :blazos
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "blazos#index"
end