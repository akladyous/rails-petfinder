class Listing < ApplicationRecord
  belongs_to :user
  has_one :pet, dependent: :destroy

  enum :listing_type, { lost: 0, found: 1}, default: 0
end
