module Listings
  class ListingCreation
    def self.call(session)
      new(session).call
    end

    def initialize(session)
      @session = session
    end

    def call
      listing = Current.current_user.listings.build(listing_params)
      listing.build_pet(pet_params)
      listing
    end

    private

    def listing_params
      @session[:listing_info]
    end

    def pet_params
      @session[:petinfo]
    end
  end
end
