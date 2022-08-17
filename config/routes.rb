Rails.application.routes.draw do
    namespace :listings do
      resources :reports, only: [:index, :show, :new, :create]
      resources :pets, only: [:new, :create]
      resources :completed, only: :show
    end

  devise_for :users
  root "home#index"
end
