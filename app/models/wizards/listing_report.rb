

module Wizards
  class ListingReport
    include ActiveModel::Model

    attr_accessor :listing_type, :last_seen, :address, :crossroads, :description

    validates :type, :last_seen, :address, :crossroads, :pet_description, presence: true
  end

end
