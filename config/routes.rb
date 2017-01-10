Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get "/about" => "static_pages#about"
  get "/contacts" => "static_pages#contacts"
  get "/delivery" => "static_pages#delivery"
  get "/promos" => "promos#index"
  resources :categories
  resources :products
  get "/hits" => "products#hits"
  resources :cart_item
  resources :cart

end
