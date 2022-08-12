class Listing < ApplicationRecord
  belongs_to :user
  has_one :pet, dependent: :destroy
  accepts_nested_attributes_for :pet, allow_destroy: true, reject_if: :all_blank
  # proc { |attr| attr['name'].blank? }

  validates :listing_type, :last_seen, :address, :description, presence: true

  enum :listing_type, { lost: 0, found: 1}, default: :lost
end
