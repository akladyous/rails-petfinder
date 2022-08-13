class AddDefaultValueToLostFoundDate < ActiveRecord::Migration[7.0]
  def change
    change_column :listings, :lost_found_date, :datetime, default: -> { "CURRENT_TIMESTAMP" }
  end
end
