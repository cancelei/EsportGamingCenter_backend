Rails.application.routes.draw do
  # Rutas para Devise, manejo de sesiones y registros
  devise_for :users, controllers: {
    registrations: 'registrations', # Controlador personalizado para el registro
    sessions: 'sessions'           # Controlador personalizado para la sesión
  }

  # Rutas estándar para juegos y reservas
  resources :games
  resources :reservations, only: [:index, :show, :create, :update, :destroy]

  # Rutas para la API (posiblemente para el frontend)
  namespace :api do
    resources :games, only: [:index, :show, :create, :update, :destroy]
  end
end
