Rails.application.routes.draw do
  root 'posts#index', as: 'home'
  resources :posts

  resources :posts do
    resources :comments
  end

  resources :authors
  resources :sessions, only: %i[new create destroy]

  # get    'login'   => 'sessions#new'
  # post   'login'   => 'sessions#create'
  # delete 'logout'  => 'sessions#destroy'

  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
