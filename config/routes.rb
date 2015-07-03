Rails.application.routes.draw do
  resources :receipts
  resources :store_its
  root 'store_its#index'
end
