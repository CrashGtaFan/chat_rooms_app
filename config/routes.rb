Rails.application.routes.draw do
  root 'chatrooms#index'
  get 'login', to: 'sessions#index'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
