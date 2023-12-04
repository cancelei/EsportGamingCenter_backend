Rails.application.routes.draw do
  resources :games, only: [:index]
  resources :reservations, only: [:index]
  resources :users, only: [:index]

  root 'games#index'
end
