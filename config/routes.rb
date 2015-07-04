Rails.application.routes.draw do
  root 'home#show'
  get 'home/show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :receipts
  resources :store_its
end

#        Prefix Verb   URI Pattern                   Controller#Action
#          root GET    /                             store_its#index
#         login GET    /login(.:format)              sessions#new
#               POST   /login(.:format)              sessions#create
#        logout POST   /logout(.:format)             sessions#destroy
#      receipts GET    /receipts(.:format)           receipts#index
#               POST   /receipts(.:format)           receipts#create
#   new_receipt GET    /receipts/new(.:format)       receipts#new
#  edit_receipt GET    /receipts/:id/edit(.:format)  receipts#edit
#       receipt GET    /receipts/:id(.:format)       receipts#show
#               PATCH  /receipts/:id(.:format)       receipts#update
#               PUT    /receipts/:id(.:format)       receipts#update
#               DELETE /receipts/:id(.:format)       receipts#destroy
#     store_its GET    /store_its(.:format)          store_its#index
#               POST   /store_its(.:format)          store_its#create
#  new_store_it GET    /store_its/new(.:format)      store_its#new
# edit_store_it GET    /store_its/:id/edit(.:format) store_its#edit
#      store_it GET    /store_its/:id(.:format)      store_its#show
#               PATCH  /store_its/:id(.:format)      store_its#update
#               PUT    /store_its/:id(.:format)      store_its#update
#               DELETE /store_its/:id(.:format)      store_its#destroy

