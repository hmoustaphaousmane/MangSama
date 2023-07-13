Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root 'mangas#index', as: :authenticated_user
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_user
    end
  end

  # Routes pour les mangas
  resources :mangas do
    get 'search', on: :collection
    post 'like', to: 'appreciations#like'
    post 'dislike', to: 'appreciations#dislike'
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:new, :create, :destroy]
  end

  # Routes pour les catégories
  resources :categories, only: [:show] do
    resources :mangas, only: [:index]
  end

  # Routes pour les utilisateurs
  resources :users, only: [:index, :show, :edit] do
    # Route pour afficher, ajouter un manga comme favoris
    resources :favorites, only: [:index, :new, :create]
  end

  # Route pour supprimer un manga favoris
  resources :favorites, only: [:index, :destroy]

end
