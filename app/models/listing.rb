class Listing < ApplicationRecord
  belongs_to :user

  validates :type, :description, presence: true

end
