Rails.application.routes.draw do
  devise_for :users

  # PAGES
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  # RIDES<<<<<<< HEAD

  resources :rides, only: [:index, :show, :new, :create, :destroy] do
    # BOOKINGS
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[update]

end
