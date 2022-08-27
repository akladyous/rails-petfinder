module Listings::PetHelper
  def pet_input_selector(attribute)
    Pet.public_send(attribute.to_s.pluralize.to_sym).map { |k, _v| [k.capitalize, k] }
  end

  def pet_constrains
    {
      name: { presence: { allowEmpty: false, message: "^Pet name can't be blank" } },
      # species: { inclusion: { within: Pet.species.keys, message: '^Species is no not included in the list' } },
      species: { presence: { allowEmpty: false, message: "^Species name can't be blank" } },
      gender: { presence: { allowEmpty: false, message: "^Gender name can't be blank" } },
      size: { presence: { allowEmpty: false, message: "^Size name can't be blank" } },
      color: { presence: { allowEmpty: false, message: "^Color name can't be blank" } },
      description: { presence: { allowEmpty: false, message: "^Description can't be blank" } }
    }
  end
end
