# step 1

module Wizards
  module Listings
    class ReportsController < ApplicationController

      def new
        @listing_report = ListingReport.new
      end

      def create
      end

    end
  end
end
