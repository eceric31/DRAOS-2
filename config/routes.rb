Rails.application.routes.draw do

  get 'address/form'

  resources :sessions, :shoes, :categories
  resources :addresses
  resources :charges

  resources :users do
    member do
      get :confirm_email
    end
  end

  resources :carts
  post '/cart' => 'carts#create'

  resources :admin

  resources :order_items, only: [:create, :update, :destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/' => 'shoes#index'
  post '/shoes/:id' => 'order_items#create'

  get 'cart' => 'carts#show'
  get '/address/new' => 'addresses#new'
  get '/addresses' => 'addresses#index'

  root to: 'shoes#index'

end
