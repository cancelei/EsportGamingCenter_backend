Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'custom_sessions' }

  resources :games do
    resources :reservations, only: [:index, :create, :show]
  end

  resources :reservations, only: [:index, :create, :show, :update, :destroy]
  resources :users, only: [:index, :show]

  root 'games#index'
end
