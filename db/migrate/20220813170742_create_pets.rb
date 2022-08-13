class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :species
      t.string :breed
      t.integer :gender
      t.string :color
      t.string :coat
      t.integer :size
      t.decimal :age, precision: 4, scale: 2
      t.decimal :height, precision: 5, scale: 2
      t.decimal :weight, precision: 5, scale: 2
      t.integer :microchip
      t.boolean :collar
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
