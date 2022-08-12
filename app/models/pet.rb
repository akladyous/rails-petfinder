class Pet < ApplicationRecord
  belongs_to :listing, optional: true
  has_one_attached :pet_image

  validates_presence_of :listing
  validates :name, :species, presence: true

  enum :species, { dog: 0, cat: 1}, default: :dog
end
