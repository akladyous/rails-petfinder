# step 2

# module Wizards
  module Listings
    class PetsController < BaseController

      def new
        @petinfo = PetInfo.new(session[:petinfo])
      end

      def create
        @petinfo = PetInfo.new(petinfo_params)
        set_session_data
        if @petinfo.valid?
          listing = ListingCreation.call(session)
          if listing.save
            session.delete(:listing_info)
            session.delete(:petinfo)
            redirect_to listings_completed_path(listing)
          end
        else
          render :new
        end
      end

      protected

      def petinfo_params
        params
          .require(:listings_pet_info)
          .permit(:image, :name,:species,:gender,:size,:breed,:color,:coat,:age,:height,:weight,:microchip,:collar,:description)
      end

      def set_session_data
        session[:petinfo] = {
          image: @petinfo.image,
          name: @petinfo.name,
          species: @petinfo.species,
          gender: @petinfo.gender,
          size: @petinfo.size,
          breed: @petinfo.breed,
          color: @petinfo.color,
          coat: @petinfo.coat,
          age: @petinfo.age,
          height: @petinfo.height,
          weight: @petinfo.weight,
          microchip: @petinfo.microchip,
          collar: @petinfo.collar,
          description: @petinfo.description,
        }
      end

    end
  end
# end
