Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Routes pour les mangas
  resources :mangas do
    resources :tomes, only: [:index, :show] do
      resources :chapters, only: [:index, :show] do
        resources :images, only: [:index, :show]
      end
    end
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
