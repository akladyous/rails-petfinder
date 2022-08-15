module Listings
  class ListingCreation

    def self.init(session)
      self.new(session).call
    end

    def initialize(session)
      @session = session
    end

    def init
      listing = Listing.new(listing_params)
      listing.build_pet
    end


    private
    def listing_params
      @session[:listing_report]
    end
    def pet_params
      @session[:petinfo]
    end
  end
end
