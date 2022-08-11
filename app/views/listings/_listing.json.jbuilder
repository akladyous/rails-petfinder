json.extract! listing, :id, :type, :published, :published_at, :lost_found_date, :address, :description, :user_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
