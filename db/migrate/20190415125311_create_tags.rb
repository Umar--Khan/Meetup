class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :main_tag
      t.string :sub_tag_01
      t.string :sub_tag_02

      t.belongs_to :event
      t.belongs_to :user

      t.timestamps
    end
  end
end
