Rails.application.routes.draw do
  # namespace :wizards do
    namespace :listings do
      resources :reports, only: [:new, :create]
      resources :pets, only: [:new, :create]
      resources :completed, only: :show
    end
  # end

    # get 'listings/reports', to: 'listings/reports#new'

  devise_for :users
  root "home#index"
end
