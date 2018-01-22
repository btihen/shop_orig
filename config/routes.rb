Rails.application.routes.draw do
  resources :tax_rates
  resources :supplier_packages
  resources :product_categories
  resources :tax_categories
  resources :sale_lines
  resources :sales
  resources :registers
  resources :stock_items
  resources :orders
  resources :order_lines
  resources :users
  resources :products
  resources :suppliers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
