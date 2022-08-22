module Listings
  class PostsController < BaseController
    skip_before_action :authenticate_user!
    before_action :listing_params

    def index
      # @listings = Listing.all.includes(:pet).order(created_at: :desc).limit(20)
      @listings_posts = Listing.search(listing_params)
    end

    protected

    def listing_params
      params.permit(:name, :species, :breed).reject! { |_k, v| v.blank? }
    end
  end
end
