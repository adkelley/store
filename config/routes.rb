Rails.application.routes.draw do
  get 'tokens/update', to: 'tokens#update'
  get 'tokens/:id', to: 'tokens#show'
  get 'tokens/reset/:id', to: 'tokens#reset'

  get 'password_resets/new'
  get 'password_resets/edit'

  root 'home#show'
  get 'home/show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :receipts
  resources :store_its
  resources :password_resets
end

#               Prefix Verb   URI Pattern                         Controller#Action
#        tokens_update GET    /tokens/update(.:format)            tokens#update
#         tokens_reset GET    /tokens/reset(.:format)             tokens#reset
#  password_resets_new GET    /password_resets/new(.:format)      password_resets#new
# password_resets_edit GET    /password_resets/edit(.:format)     password_resets#edit
#                 root GET    /                                   home#show
#            home_show GET    /home/show(.:format)                home#show
#                login GET    /login(.:format)                    sessions#new
#                      POST   /login(.:format)                    sessions#create
#               logout DELETE /logout(.:format)                   sessions#destroy
#             receipts GET    /receipts(.:format)                 receipts#index
#                      POST   /receipts(.:format)                 receipts#create
#          new_receipt GET    /receipts/new(.:format)             receipts#new
#         edit_receipt GET    /receipts/:id/edit(.:format)        receipts#edit
#              receipt GET    /receipts/:id(.:format)             receipts#show
#                      PATCH  /receipts/:id(.:format)             receipts#update
#                      PUT    /receipts/:id(.:format)             receipts#update
#                      DELETE /receipts/:id(.:format)             receipts#destroy
#            store_its GET    /store_its(.:format)                store_its#index
#                      POST   /store_its(.:format)                store_its#create
#         new_store_it GET    /store_its/new(.:format)            store_its#new
#        edit_store_it GET    /store_its/:id/edit(.:format)       store_its#edit
#             store_it GET    /store_its/:id(.:format)            store_its#show
#                      PATCH  /store_its/:id(.:format)            store_its#update
#                      PUT    /store_its/:id(.:format)            store_its#update
#                      DELETE /store_its/:id(.:format)            store_its#destroy
#      password_resets GET    /password_resets(.:format)          password_resets#index
#                      POST   /password_resets(.:format)          password_resets#create
#   new_password_reset GET    /password_resets/new(.:format)      password_resets#new
#  edit_password_reset GET    /password_resets/:id/edit(.:format) password_resets#edit
#       password_reset GET    /password_resets/:id(.:format)      password_resets#show
#                      PATCH  /password_resets/:id(.:format)      password_resets#update
#                      PUT    /password_resets/:id(.:format)      password_resets#update
#                      DELETE /password_resets/:id(.:format)      password_resets#destroy
