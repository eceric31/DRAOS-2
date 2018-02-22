Rails.application.routes.draw do

  get 'address/form'

  resources :users, :sessions, :shoes, :categories
  resources :addresses
  resources :charges

  resources :carts
  post '/cart' => 'carts#create'


  resources :order_items, only: [:create, :update, :destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/' => 'shoes#index'
  post '/shoes/:id' => 'order_items#create'

  get 'cart' => 'carts#show'

  root to: 'shoes#index'

end
