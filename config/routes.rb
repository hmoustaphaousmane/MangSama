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
  # get 'users/:id' => 'users#show'
  resources :users, only: [:index, :show, :edit] do
    resources :favorites, only: [:index]
  end

end
