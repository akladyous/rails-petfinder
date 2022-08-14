

module Listings
  class ListingReport
    include ActiveModel::Model
    # include ActiveModel::Validations

    attr_accessor :listing_type, :lost_found_date, :address, :crossroads, :pet_description, :comment

    validates :listing_type, :lost_found_date, :address, :crossroads, :pet_description, :comment, presence: true
    # validates_presence_of :listing_type, :lost_found_date, :address, :crossroads, :pet_description, :comment

    # def initialize(params = {})
    #   # params.each { |key,value| instance_variable_set("@#{key}", value) }
    #   # set_defaults
    #   # instance_variables.each {|var| self.class.send(:attr_accessor, var.to_s.delete('@'))}

    #   self.listing_type |= params.listing_type
    #   self.lost_found_date = params.lost_found_date
    #   self.address = params.address
    #   self.crossroads = params.crossroads
    #   self.pet_description = params.pet_description
    #   self.comment = params.comment
    # end

  end
end
