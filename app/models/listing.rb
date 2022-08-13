class Listing < ApplicationRecord
  belongs_to :user
  has_one :pet

end
