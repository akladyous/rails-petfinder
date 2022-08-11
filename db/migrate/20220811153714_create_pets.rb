class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :color
      t.integer :gender, default: 0
      t.integer :size, default: 0
      t.integer :species, default: 0
      t.decimal :height, precision: 5, scale: 2, default: 0
      t.decimal :weight, precision: 5, scale: 2, default: 0
      t.decimal :age, precision: 4, scale: 2, default: 0
      t.string :coat
      t.integer :microchip
      t.boolean :collar
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
