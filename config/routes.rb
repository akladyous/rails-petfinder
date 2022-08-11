Rails.application.routes.draw do
  resources :pets
  resources :listings

  devise_for :users
  root "home#index"
end
