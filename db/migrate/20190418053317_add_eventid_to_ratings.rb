class AddEventidToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :event_id, :integer
  end
end
