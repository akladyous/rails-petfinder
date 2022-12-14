# step 1

  module Listings
    class ReportsController < BaseController

      def index
        @listings = Listing.all.includes(:pet).order(created_at: :desc)
      end

      def new
        @listing_report = ListingReport.new(session[:listing_info])
      end

      def show
        @listing = Listing.find_by(id: params[:id])
      end

      def create
        @listing_report = ListingReport.new(listing_report_params)
        if @listing_report.valid?
          set_session_data
          redirect_to new_listings_pet_path
        else
          render :new
        end
      end

      private

      def listing_report_params
        params.require(:listings_listing_report).permit(
            :listing_type,
            :lost_found_date,
            :address,
            :crossroads,
            :pet_description,
            :comment
          )
      end

      def set_session_data
        session[:listing_info] = {
          listing_type: @listing_report.listing_type,
          lost_found_date: @listing_report.lost_found_date,
          address: @listing_report.address,
          crossroads: @listing_report.crossroads,
          pet_description: @listing_report.pet_description,
          comment: @listing_report.comment,
        }
      end
    end

  end
