class Listing < ApplicationRecord
  belongs_to :user

  validates :listing_type, :last_seen, :address, :description

  enum :listing_type, { lost: 0, found: 1}, default: :lost
end
