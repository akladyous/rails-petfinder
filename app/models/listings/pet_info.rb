module Listings
  class PetInfo
    include ActiveModel::Model

    attr_accessor :name, :species, :gender, :size, :breed, :color, :coat, :age, :height, :weight, :microchip, :collar, :description

    validates :species, :size, :color, :collar, :description, presence: true

  end
end
