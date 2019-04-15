class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :content
      
      t.belongs_to :event
          
      t.timestamps
    end
  end
end
