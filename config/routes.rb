Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'payments/index'
  resources :payment_methods
  resources :carts, only: [:create]
  resources :orders
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :products
  resources :brands
  resources :subcategories
  resources :categories
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
