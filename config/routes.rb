Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # devise_scope :user do
  #   authenticated :user do
  #     root 'mangas#index', as: :authenticated_user
  #   end
  
  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_user
  #   end
  # end

  # Routes pour les mangas
  resources :mangas do
    get 'search', on: :collection
    resources :appreciations, only: [:create, :destroy]
    resources :comments, only: [:index, :create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  # Routes pour les catégories
  resources :categories, only: [:index, :show] do
    resources :mangas, only: [:index]
  end

  # Routes pour les utilisateurs
  resources :users, only: [:index, :show] do
    resources :favorites, only: [:index]
  end

end
