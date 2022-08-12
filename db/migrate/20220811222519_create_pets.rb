class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :species
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
