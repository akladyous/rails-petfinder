module Listings
  class PostsController < BaseController
    include Pagy::Backend
    skip_before_action :authenticate_user!
    before_action :listing_params

    def index
      @pagy, @listings_posts = pagy(Listing.search(listing_params), items: 9)
    end

    protected

    def listing_params
      params.permit(:name, :species, :breed).reject! { |_k, v| v.blank? }
    end
  end
end
