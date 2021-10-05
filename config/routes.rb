Rails.application.routes.draw do
  get 'payments/index'
  resources :payment_methods
  resources :carts
  resources :orders
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  resources :products
  resources :brands
  resources :subcategories
  resources :categories
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
