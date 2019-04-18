class AddColumnImgs < ActiveRecord::Migration[5.2]
  def change
    add_column :imgs, :latitude, :decimal
    add_column :imgs, :longitude, :decimal
  end
end
