Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "islands#index"

  resources :islands, only: [:new, :show, :create] do
    resources :bookings, only: [:new, :create]
  end
  # Route to access favorites
  get '/favorites', to: 'islands#favorites', as: 'favorites'
  # Custom routes for favorite and unfavorite actions
  post '/islands/:id/favorite', to: 'islands#favorite', as: 'favorite_island'
  delete '/islands/:id/unfavorite', to: 'islands#unfavorite', as: 'unfavorite_island'
  resources :bookings, only: [:index]
end
