class Listing < ApplicationRecord
  belongs_to :user
  has_one :pet, dependent: :destroy

  enum :listing_type, { lost: 0, found: 1 }, default: 0

  def self.search(params)
    return all unless params.present?

    query = Listing.joins(:pet)
    query = query.where('pets.name LIKE ?', sanitize_sql_like(params[:name]) + '%') if params.include?(:name)

    params.except(:name).each do |k, v|
      sub_query = { k => v }
      sub_query.transform_keys!(&:to_sym)
      query = query.joins(:pet).where(pets: sub_query)
      # query = query.joins(:pet).where(sanitize_sql_hash_for_assignment(sub_query, self))
    end
    query
  end

  scope :random_sample, -> (num = nil) { order('RANDOM()').take(num || 10) }
end
