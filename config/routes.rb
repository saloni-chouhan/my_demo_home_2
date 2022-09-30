Rails.application.routes.draw do

  get 'homes/index'
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]

  get '/search', to: "bookings#search"

  get '/error', to: "flights#error"

  root to: 'pages#home'
  resources :airports  do 
    resources :airlines
  end
  resources :flights

  resources :schedules

  resources :tickets

  resources :bookings 

  # resources :airlines, only: [:index,:show,:create,:new] do 
  #     resources :flights
  # end
   

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 