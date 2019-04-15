class CreateImgs < ActiveRecord::Migration[5.2]
  def change
    create_table :imgs do |t|
      t.string :url
      
      t.belongs_to :event 
      
      t.timestamps
    end
  end
end
