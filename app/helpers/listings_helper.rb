module ListingsHelper

  def listing_type_options
    Listing.listing_types.map { |k,v| [k.capitalize, k]}
  end

  def pet_species_options
    Pet.species.map{ |k,v| [k.capitalize, k] }
  end
end
