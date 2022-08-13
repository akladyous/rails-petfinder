Rails.application.routes.draw do
  # resources :listings
  namespace :wizards do
    namespace :listings do
      resources :lost_found, only: [:new, :create]
      resources :lost_found_pet, only: [:new, :create]
      resources :completed, only: :show
    end
  end

  # namespace :wizards do
  #   namespace :companies do
  #     resources :profiles, only: [:new, :create]
  #     resources :locations, only: [:new, :create]
  #     resources :finished, only: :show
  #   end
  # end

  devise_for :users
  root "home#index"
end
=begin
wizards_companies_profiles POST /wizards/companies/profiles(.:format)      wizards/companies/profiles#create
new_wizards_companies_profile GET  /wizards/companies/profiles/new(.:format)  wizards/companies/profiles#new
wizards_companies_locations POST /wizards/companies/locations(.:format)     wizards/companies/locations#create
new_wizards_companies_location GET  /wizards/companies/locations/new(.:format) wizards/companies/locations#new
wizards_companies_finished GET  /wizards/companies/finished/:id(.:format)  wizards/companies/finished#show
=end
