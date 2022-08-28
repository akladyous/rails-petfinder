Rails.application.routes.draw do
  namespace :listings do
    resources :reports, only: %i[index show new create]
    resources :pets, only: %i[new create show]
    resources :completed, only: :show
    resources :posts, only: :index
  end

  devise_for :users
  resources :about, only: :index
  resources :contact, only: %i[index create]

  root 'home#index'
end
