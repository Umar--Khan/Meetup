class NewTableTagJoiner < ActiveRecord::Migration[5.2]
  def change
    create_table :usertags do |t|
      t.integer :user_id
      t.integer :tag_id
    end
    create_table :eventtags do |t|
      t.integer :event_id
      t.integer :tag_id
    end
  end
end
