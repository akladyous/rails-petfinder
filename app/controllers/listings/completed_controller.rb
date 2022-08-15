
  module Listings
    class CompletedController < BaseController

      def show
        @listing = Listing.find(params[:id])
      end

    end
  end
