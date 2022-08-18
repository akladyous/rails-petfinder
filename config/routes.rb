Rails.application.routes.draw do

    namespace :listings do
      resources :reports, only: [:index, :show, :new, :create]
      resources :pets, only: [:new, :create]
      resources :completed, only: :show

      resources :posts, only: [:index, :show, :post]
    end

  devise_for :users
  root "home#index"
end
