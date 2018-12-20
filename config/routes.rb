# frozen_string_literal: true

Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root 'store#home', as: 'store_home'

  get 'info/index'
  get 'store/index'

  get 'all_users_path' => 'users#index'

  get 'admin' => 'admin#index'
  get '/products/show/' => 'products#one'
  get '/store/filter' => 'store#filter_products'
  get '/orders/o' => 'orders#one'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    get 'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts

  resources :products do
    get :who_bought, on: :member
  end

  resources :line_items do
    put 'decrease', on: :member
    put 'increase', on: :member
  end
end
