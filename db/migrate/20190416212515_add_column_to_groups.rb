class AddColumnToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :number, :integer
  end
end
