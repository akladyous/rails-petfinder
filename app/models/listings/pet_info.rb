module Listings
  class PetInfo
    include ActiveModel::Model

    attr_accessor :image, :name, :species, :gender, :size, :breed, :color, :coat, :age, :height, :weight, :microchip,
                  :collar, :description

    validates :name, :species, :gender, :size, :color, :description, presence: true
  end
end
