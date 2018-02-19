Rails.application.routes.draw do

  resources :users, :sessions, :shoes, :categories
  resources :charges

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/' => 'shoes#index'
  post '/shoes/:id' => 'order_items#create'

  root to: 'shoes#index'

end
