module ListingsHelper

  def listing_type_options
    Listing.listing_types.map { |k,v| [k.capitalize, v]}
  end
end
