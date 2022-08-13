# step 1

module Wizards
  module Listings
    class ReportsController < ApplicationController

      def new
        # session[:listing_report] = nil
        @listing_report = ListingReport.new
      end

      def create
        @listing_report = ListingReport.new(listing_report_params)
        # binding.irb
        if @listing_report.valid?
          # listing_report_params.to_h
          set_session_data
          redirect_to new_wizards_listings_pet_path
        else
          render :new
        end
      end

      private

      def listing_report_params
        params.require(:wizards_listing_report).permit(
            :listing_type,
            :lost_found_date,
            :address,
            :crossroads,
            :pet_description,
            :comment
          )
      end

      def set_session_data
        session[:listing_report] = {
              listing_type: @listing_report.listing_type,
              lost_found_date: @listing_report.lost_found_date,
              address: @listing_report.address,
              crossroads: @listing_report.crossroads,
              pet_description: @listing_report.pet_description,
              comment: @listing_report.comment
            }
      end
    end

  end
end
