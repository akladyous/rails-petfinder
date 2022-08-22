module ListingHelper
  include Pagy::Frontend
  def listing_type_options
    Listing.listing_types.map { |k, _v| [k.capitalize, k] }
  end
end
