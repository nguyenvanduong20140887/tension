Rails.application.routes.draw do

  get 'carts/index'

  devise_for :users

  resources :users, only: [ :destroy ]

  resources :products

  resources :collections, only: [ :show ]

  resources :order_lines, only: [ :create, :update, :destroy ]

  resources :orders, only: [ :index, :show, :update, :destroy ]

  namespace :admin do
    resources :users
  end

  post 'search' => 'products#search'
  get 'cart' => 'orders#cart'
  get 'logout' => 'orders#logout'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
