Rails.application.routes.draw do
  devise_for :users

  # PAGES
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  # RIDES
  resources :rides, only: [:show, :new, :create] do
    # BOOKINGS
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[update]
end
