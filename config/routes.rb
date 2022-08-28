Rails.application.routes.draw do
  namespace :listings do
    resources :reports, only: %i[index show new create]
    resources :pets, only: %i[new create show]
    resources :completed, only: :show
    resources :posts, only: :index
  end

  devise_for :users
  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'

  root 'home#index'
end
