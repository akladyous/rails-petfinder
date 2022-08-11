class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.integer :type
      t.boolean :published, default: true
      t.datetime :published_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :lost_found_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :address
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
