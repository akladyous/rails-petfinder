class AddListingToPets < ActiveRecord::Migration[7.0]
  def change
    add_reference :pets, :listing, null: false, foreign_key: true
  end
end
