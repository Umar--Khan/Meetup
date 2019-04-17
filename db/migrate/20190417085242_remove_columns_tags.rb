class RemoveColumnsTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :sub_tag_01
    remove_column :tags, :sub_tag_02
    remove_column :tags, :event_id
    remove_column :tags, :user_id



  end
end
