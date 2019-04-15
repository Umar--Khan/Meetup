class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :main_tag
      t.string :sub_tag_01
      t.string :sub_tag_02

      t.has_many :users
      t.has_many :events

      t.timestamps
    end
  end
end
