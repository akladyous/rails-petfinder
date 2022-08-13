class Listing < ApplicationRecord
  belongs_to :user
  has_one :pet

  enum :listing_type, { lost: 0, found: 1}, default: 0
end
