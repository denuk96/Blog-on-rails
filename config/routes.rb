Rails.application.routes.draw do
  devise_for :users
  root 'posts#index', as: 'home'
  resources :posts #, except: [:destroy]

  # namespace :admin do
  #   resources :posts
  # end
end
