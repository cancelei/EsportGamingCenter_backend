Rails.application.routes.draw do
  resources :games do
    resources :reservations, only: [:index]
  end
  
  resources :reservations, only: [:index]
  resources :users, only: [:index]

  root 'games#index'
end
