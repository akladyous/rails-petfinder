class Pet < ApplicationRecord
  belongs_to :listing, optional: true

  validates :name, :species, presence: true

  enum :species, { dog: 0, cat: 1}, default: :dog
end
