Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  root 'chatrooms#index'
  get 'login', to: 'sessions#index'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :messages, only: [:new, :create]
  resources :users
end
