Rails.application.routes.draw do
  get 'home/index'
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'payments/index'
  resources :payment_methods
  resources :carts, only: [:update, :show, :destroy] do
    member do
      post :pay_with_paypal
      get :process_paypal_payment
    end
  end
  resources :orders
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :products
  resources :brands
  resources :subcategories
  resources :categories
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
