class Listing < ApplicationRecord
  belongs_to :user
  has_one :pet, dependent: :destroy

  enum :listing_type, { lost: 0, found: 1 }, default: 0

  def self.search(params)
    if params[:query].blank?
      all
    else
      where('name LIKE ?', "%#{sanitize_sql_like(params[:query])}%")
    end
  end
end
