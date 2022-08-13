Rails.application.routes.draw do
  # resources :listings
  namespace :wizards do
    namespace :listings do
      resources :report, only: [:new, :create]
      resources :pet, only: [:new, :create]
      resources :completed, only: :show
    end
  end

  devise_for :users
  root "home#index"
end
