Rails.application.routes.draw do
  resources :sales
  resources :registers
  resources :stock_items
  resources :orders
  resources :order_items
  resources :users
  resources :products
  resources :suppliers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
