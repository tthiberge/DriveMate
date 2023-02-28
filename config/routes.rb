Rails.application.routes.draw do
  devise_for :users

  # PAGES
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  # RIDES
  resources :rides, only: [:show, :new, :create , :destroy]

  # BOOKINGS
  resources :bookings, only: %i[create update]
end
