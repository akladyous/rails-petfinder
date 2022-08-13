module Wizards
  class LostFound
    include ActiveModel::Model

    attr_accessor :listing_type, :last_seen, :address, :crossroads, :description

    validates :listing_type, :last_seen, :address, :crossroads, :description, presence: true
  end

end
