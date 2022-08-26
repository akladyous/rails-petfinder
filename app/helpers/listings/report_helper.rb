module Listings::ReportHelper
  def report_constrains
    {
      address: { presence: { allowEmpty: false, message: "^Address can't be blank" } },
      crossroads: { presence: { allowEmpty: false, message: "^Nearest Cross Road can't be blank" } },
      pet_description: {
        presence: { allowEmpty: false, message: "^Pet Description can't be blank" },
        length: { minimum: 5, maximum: 128, message: '^Pet Description must be between 5 and 128 characters' }
      },
      comment: { presence: { allowEmpty: false, message: "^Comment  can't be blank" },
                 length: { minimum: 5, maximum: 128, message: '^Comment must be between 5 and 128 characters' } }
    }
  end
end
