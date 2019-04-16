class AddColumnUserPassword < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password, :text
  end
end
