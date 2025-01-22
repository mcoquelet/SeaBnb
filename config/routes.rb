Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
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
  resources :bookings, only: [:index] do
    resources :reviews, only: [:new, :create]
  end
end
