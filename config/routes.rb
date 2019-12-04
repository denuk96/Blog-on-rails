Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'posts#index', as: 'home'

  resources :posts

  resources :posts do
    resources :comments do
      resources :likes
      post '/dislikes' => 'likes#dislike', as: :dislike_create
    end
  end

  resources :authors
  resources :sessions, only: %i[new create destroy]

  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
