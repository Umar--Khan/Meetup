class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :dob
      t.string :loc
      t.boolean :admin

      t.timestamps
    end
  end
end
