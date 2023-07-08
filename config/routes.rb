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
  resources :categories, only: [:show] do
    resources :mangas, only: [:index]
  end

  # Routes pour les utilisateurs
  # get 'users/:id' => 'users#show'
  resources :users, only: [:index, :show, :edit] do
    resources :favorites, only: [:index]
  end

end
