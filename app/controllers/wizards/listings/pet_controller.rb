module Wizards
  module Listings
    class PetController < ApplicationController

      def new
        @pet_info = PetInfo.new
      end

      def create

      end


      protected

      def pet_info_params
        params
          .require(:pet)
          .permit(
            :name,
            :species,
            :gender,
            :size,
            :breed,
            :color,
            :coat,
            :age,
            :height,
            :weight,
            :microchip,
            :collar,
            :description
          )
      end

    end
  end
end
