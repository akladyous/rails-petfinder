module Listings
  class PetInfo
    include ActiveModel::Model
    # include ActiveStorage

    # has_one_attached :image

    attr_accessor :image, :name, :species, :gender, :size, :breed, :color, :coat, :age, :height, :weight, :microchip, :collar, :description

    validates :name, :species, :gender, :size, presence: true

  end
end
