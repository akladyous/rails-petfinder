module PetHelper
    def pet_input_selector(attribute)
      Pet.public_send(attribute.to_s.pluralize.to_sym).map { |k,v| [k.capitalize, k] }
    end

end
