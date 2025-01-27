Rails.application.routes.draw do
  get "forums/index"
  get "forums/show"
  get "forums/new"
  get "forums/create"
  get "forums/edit"
  get "forums/update"
  get "forums/destroy"
  # Page d'accueil
  root "pages#home"

  # Utilisateurs (admins, enseignants, annotateurs)
  resources :users

  # Équipes
  resources :teams do
    member do
      get :details # Chargement dynamique pour une équipe spécifique
    end
  end

  # Annotations et révisions
  resources :annotations do
    resources :revisions, only: [:index, :create]
  end

  # Catégories
  resources :categories do
    collection do
      get :search # Recherche de catégories via autocomplétion
    end
  end

  # Gestion du forum
  resources :forums do
    resources :topics do
      resources :posts, only: [:create, :edit, :update, :destroy]
    end
  end

  # Pages statiques ou spécifiques
  get "/forum", to: "forums#index" # Redirige vers l'index des forums
  get "/rule_book", to: "pages#rule_book"
  get "/instructor_manual", to: "pages#instructor_manual"
  get "/help", to: "pages#help"
end
