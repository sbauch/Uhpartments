class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :city
      t.integer :zip
      t.float :lat
      t.float :lon
      
      t.timestamps
    end
  end
end
