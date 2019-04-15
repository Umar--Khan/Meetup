class CreateHookups < ActiveRecord::Migration[5.2]
  def change
    create_table :hookups do |t|
      t.datetime :time_date
      
      t.belongs_to :event

      t.timestamps
    end
  end
end

