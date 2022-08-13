class ChangeColumnNameToListings < ActiveRecord::Migration[7.0]
  def change
    rename_column :listings, :type, :listing_type
  end
end
