class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.integer :type, default: 0
      t.datetime :lost_found_date, default: -> { "CURRENT_TIMESTAMP" }
      t.string :address
      t.string :crossroads
      t.text :pet_description
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
