Rails.application.routes.draw do
  devise_for :users

  # PAGES
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  # RIDES<<<<<<< HEAD

  resources :rides, only: [:show, :new, :create, :edit, :update, :destroy] do
    # BOOKINGS
    resources :bookings, only: %i[create]
  end

  resources :bookings, except: [:create] do
    get :update_status
  end
  # On n'a pas besoin de nester, donc on le sort
  # Good practice: on nest dans resources :bookings, except create qui est déjà au-dessus
  # On crée la route qui envoie vers la méthode
  # NB: en ayant fait resources :bookings, except: [:create], ça a créé toutes les routes du RUD dans rails routes
  # MAIS ce n'est pas un problème. Je n'ai pas besoin de créer les méthodes dans le controller, ça ne va pas planter
  # En revanche, si quelqu'un / moi met demande cet URL, ça plantera
  # en disant qu'il n'y a pas de méthode associée dans le controller
  # ==> Dans dahsboard, je modifie les link_to avec le nouveau préfixe_path + je mets ce que je veux récupérere in params

  # CI DESSOUS, ça aurait PU/DU marcher (moi ça cassait), mais Hugo m'a dit de privilégier d'utiliser RESOURCES
  # (cf-dessus)
  # get 'bookings/:id', to: "bookings#status_to_confirmed", as: :status_confirmed
  # get 'bookings/:id', to: "bookings#status_to_declined", as: :status_declined
  resources :bookings, only: %i[update]
end
