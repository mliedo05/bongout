Rails.application.routes.draw do
  resources :products
  resources :brands
  resources :subcategories
  resources :categories
  root to: "product#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
