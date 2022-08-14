# step 2

# module Wizards
  module Listings
    class PetsController < BaseController

      def new
        @pet_info = PetInfo.new
      end

      def create
        @pet_info = PetInfo.new(pet_info_params)
        if @pet_info.valid?
          redirect_to wizards_listings_pets_path
        else
          render :new
        end
      end



      protected

      def pet_info_params
        params
          .require(:pet)
          .permit(:name,:species,:gender,:size,:breed,:color,:coat,:age,:height,:weight,:microchip,:collar,:description)
      end

      def set_session_data
        sesstion[:petinfo] = {
          name: @pet_info.name,
          species: @pet_info.species,
          gender: @pet_info.gender,
          size: @pet_info.size,
          breed: @pet_info.breed,
          color: @pet_info.color,
          coat: @pet_info.coat,
          age: @pet_info.age,
          height: @pet_info.height,
          weight: @pet_info.weight,
          microchip: @pet_info.microchip,
          collar: @pet_info.collar,
          descriptio: @pet_info.descriptio,
        }
      end

    end
  end
# end
