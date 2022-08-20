module Listings
  class PostsController < BaseController
    skip_before_action :authenticate_user!

    def index
      @listings = Listing.all.includes(:pet).order(created_at: :desc).limit(20)
      # @listings_posts = Listing.joins(:pet).order(created_at: :desc).limit(25)
    end

    # def show
    #   @listings_posts = Listing.find(params[:id])
    # end
  end
end
