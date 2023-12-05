Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

  resources :games do
    resources :reservations, only: [:index]
  end
  
  resources :reservations, only: [:index]

  root 'games#index'
end
