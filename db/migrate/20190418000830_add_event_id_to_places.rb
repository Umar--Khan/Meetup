class AddEventIdToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :event_id, :integer
  end
end
