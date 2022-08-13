module ListingHelper

    def listing_type_options
      Listing.listing_types.map{ |k,v| [k.capitalize, k] }
    end
end
