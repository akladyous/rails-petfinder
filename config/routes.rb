Rails.application.routes.draw do
  # resources :listings
  namespace :wizards do
    namespace :listings do
      resources :lost_found, only: [:new, :create]
      resources :lost_found_pet, only: [:new, :create]
      resources :completed, only: :show
    end
  end

  devise_for :users
  root "home#index"
end
