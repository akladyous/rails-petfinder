module Listings
  class ListingReport
    include ActiveModel::Model
    # include ActiveModel::Validations

    attr_accessor :listing_type, :lost_found_date, :address, :crossroads, :pet_description, :comment

    validates :listing_type, :lost_found_date, :address, :crossroads, :pet_description, :comment, presence: true
  end
end
