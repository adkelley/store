Rails.application.routes.draw do
  root 'store_its#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  resources :receipts
  resources :store_its
end
