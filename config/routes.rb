Rails.application.routes.draw do
  root to: 'pages#home'
  resources :airports do 
    resources :airlines,only: [:index,:new,:create]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
