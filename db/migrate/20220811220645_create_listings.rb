class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.integer :listing_type, default: 0
      t.datetime :last_seen, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :address
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
