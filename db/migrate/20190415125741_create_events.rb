class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :time
      t.string :loc
      t.timestamps
    end
  end
end
