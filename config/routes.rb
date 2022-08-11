Rails.application.routes.draw do
  resources :pets
    devise_for :users
    root "home#index"
end
