  class ListingCreation
    def self.call(session)
      self.new(session).call
    end

    def initialize(session)
      @session = session
    end

    def call
      # listing = Listing.new(listing_params)
      # listing.user = Current.current_user
      listing = Current.current_user.listings.build(listing_params)
      listing.build_pet(pet_params)
      return listing
    end


    private
    def listing_params
      @session[:listing_info]
    end
    def pet_params
      @session[:petinfo]
    end
  end
# {"listing_type"=>"lost", "lost_found_date"=>"2022-08-15", "address"=>"user1", "crossroads"=>"user1", "pet_description"=>"user1", "comment"=>"user1"}
# {:name=>"asd", :species=>"dog", :gender=>"male", :size=>"small", :breed=>nil, :color=>nil, :coat=>nil, :age=>nil, :height=>nil, :weight=>nil, :microchip=>nil, :collar=>nil, :description=>nil}
