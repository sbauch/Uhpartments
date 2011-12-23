class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :building_address
      t.string :agency
      t.string :complaint_type
      t.string :descriptor
      t.date :created
      t.date :closed

      t.timestamps
    end
  end
end
