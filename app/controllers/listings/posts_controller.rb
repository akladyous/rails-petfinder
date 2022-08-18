module Listings
  class PostsController < BaseController

    skip_before_action :authenticate_user!

    def index
      @listings = Listing.all.includes(:pet).order(created_at: :desc)
    end

    def show
    end

  end
end
