class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.point :location, :geographic => true
      t.timestamps
    end
  end
end
